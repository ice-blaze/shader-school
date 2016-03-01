precision mediump float;

#pragma glslify: PointLight = require(./light.glsl)

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

  vec3 res = ambient;

  for(int i=0;i<NB_LIGHTS;i++){
    float phong = phongWeight(lightsDirection[i],vNormal,vEyeDirection,lights[i].shininess);

    float lambert = lambertWeight(vNormal, lightsDirection[i]);

    res += lights[i].diffuse*lambert + lights[i].specular*phong;
  }

  gl_FragColor = vec4(res,1);
}
