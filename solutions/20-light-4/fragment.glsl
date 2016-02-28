precision mediump float;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 ambient;
uniform vec3 diffuse;
uniform vec3 specular;

uniform vec3 lightPosition;

uniform float shininess;

varying vec3 vEyeDirection;
varying vec3 vNormal;
varying vec3 vPosition;


float lambertWeight(vec3 n, vec3 d) {
  return dot(n, d);
  // correct version but should be an issue with shader school
  // return max(dot(n, d), 0.0);
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
  // vPosition = (project * view * model * v4(vPosition,0)).xyz;
  vec3 lightDirection = vPosition;

  float phong = phongWeight(lightDirection,vNormal,vEyeDirection,shininess);
  float lambert = lambertWeight(vNormal, lightDirection);
  vec3 res = ambient + diffuse*lambert + specular*phong;
  gl_FragColor = vec4(res,1);
  // gl_FragColor = vec4(1,0,0,1);
}
