precision highp float;

uniform sampler2D prevState;
uniform vec2 stateSize;

float state(vec2 coord) {
  return texture2D(prevState, fract(coord / stateSize)).r;
}

void main() {
  vec2 coord = gl_FragCoord.xy;
  float s = state(coord);
  float counter = 0.0;// when declaring float have to 0.0, if vec2 just 0 is ok

  for (int i = -1; i <= 1; i++)
  for (int j = -1; j <= 1; j++) {
    counter += state(coord + vec2(i, j));
  }

  if(counter > 3.0+s || counter < 3.0){
    gl_FragColor = vec4(0,0,0, 1.0);
  }else{
    gl_FragColor = vec4(1,1,1, 1.0);
  }
}
