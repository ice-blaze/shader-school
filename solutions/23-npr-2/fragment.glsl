precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 warm;
uniform vec3 cool;
uniform vec3 lightDirection;

varying vec3 worldNormal;

float lambertWeight(vec3 n, vec3 d) {
  return max(dot(n, d), 0.0);
}

float goochWeight(vec3 normal, vec3 lightDirection) {
  return 0.5 * (1.0 + dot(normal, lightDirection));
}

vec3 goochColor(vec3 cool, vec3 warm, float weight) {
  return (1.0 - weight) * cool + weight * warm;
}

void main() {

  float goochW = goochWeight(worldNormal, lightDirection);

  vec3 res = goochColor(cool,warm,goochW);

  gl_FragColor = vec4(res,1);
  // gl_FragColor = vec4(1,1,1,1);
}
