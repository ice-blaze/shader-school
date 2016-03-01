precision mediump float;

uniform sampler2D prevState;
uniform vec2 stateSize;
uniform float kdiffuse;
uniform float kdamping;

float state(vec2 x) {
  return texture2D(prevState, fract(x / stateSize)).r;
}

float state(float x1, float y1) {
  vec2 x = vec2(x1,y1);
  return texture2D(prevState, fract(x / stateSize)).r;
}

float laplacian(vec2 v) {
  return (
    state(v.x-1.,v.y) +
    state(v.x+1.,v.y) +
    state(v.x,v.y-1.) +
    state(v.x,v.y+1.)
  ) - 4.0 * state(v.x,v.y);
}

void main() {
  vec2 coord = gl_FragCoord.xy;

  float laplace = laplacian(coord);
  float preveState = state(coord);
  float y = (1.0 - kdamping) * (kdiffuse*laplace + preveState);

  gl_FragColor = vec4(y,y,y,1);
}
