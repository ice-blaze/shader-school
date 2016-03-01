precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 diffuse;
uniform vec3 lightDirection;
uniform float numBands;

varying vec3 worldNormal;

float lambertWeight(vec3 n, vec3 d) {
  return max(dot(n, d), 0.0);
}

void main() {

  float lambert = lambertWeight(worldNormal, lightDirection);

  float celIntensity = ceil(lambert * numBands) / numBands;

  vec3 res = diffuse*celIntensity;

  gl_FragColor = vec4(res,1);
  // gl_FragColor = vec4(1,1,1,1);
}
