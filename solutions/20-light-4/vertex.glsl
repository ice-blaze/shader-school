precision mediump float;

attribute vec3 position;
attribute vec3 normal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 lightPosition;

varying vec3 vEyeDirection;
varying vec3 vNormal;
varying vec3 vLightDirection;

void main() {
  vec4 viewPosition = view * model * vec4(position, 1.0);
  gl_Position = projection * viewPosition;

  // vLightDirection = normalize(lightPosition - position);
  // TODO don't understand why should view* the lightposition and view*model* the position, not symetric why ?
  vec4 viewLight = view * vec4(lightPosition, 1.0);
  vLightDirection = normalize(viewLight.xyz - viewPosition.xyz);


  vNormal = normalize((vec4(normal, 0.0) * inverseModel * inverseView).xyz);
  vEyeDirection = normalize(viewPosition.xyz);
}
