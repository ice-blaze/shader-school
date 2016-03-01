precision mediump float;

#pragma glslify: PointLight = require(./light.glsl)

attribute vec3 position;
attribute vec3 normal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 ambient;

const int NB_LIGHTS = 4;
uniform PointLight lights[4];

varying vec3 vNormal;
varying vec3 vEyeDirection;
varying vec3 lightsDirection[4];

float lambertWeight(vec3 n, vec3 d) {
  return max(dot(n, d), 0.0);
}

float phongWeight(
  vec3 lightDirection,
  vec3 surfaceNormal,
  vec3 eyeDirection,
  float shininess
) {
  //First reflect light by surface normal
  vec3 rlight = reflect(lightDirection, surfaceNormal);

  //Next find the projected length of the reflected
  //light vector in the view direction
  float eyeLight = max(dot(rlight, eyeDirection), 0.0);

  //Finally exponentiate by the shininess factor
  return pow(eyeLight, shininess);
}

void main() {
  vec4 viewPosition = view * model * vec4(position, 1.0);
  gl_Position = projection * viewPosition;

  // vLightDirection = normalize(lightPosition - position);
  // TODO don't understand why should view* the lightposition and view*model* the position, not symetric why ?
  for(int i=0;i<NB_LIGHTS;i++){
    vec4 viewLight = view * vec4(lights[i].position, 1.0);
    lightsDirection[i] = normalize(viewLight.xyz - viewPosition.xyz);
  }

  vNormal = normalize((vec4(normal, 0.0) * inverseModel * inverseView).xyz);
  vEyeDirection = normalize(viewPosition.xyz);
}
