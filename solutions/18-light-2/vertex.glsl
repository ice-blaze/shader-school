precision mediump float;

attribute vec3 position;
attribute vec3 normal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 ambient;
uniform vec3 diffuse;
uniform vec3 lightDirection;

varying vec3 vColor;

float lambertWeight(vec3 n, vec3 d) {
  return max(dot(n, d), 0.0);
}

float parallelDistance(
  vec3 surfacePoint,
  vec3 surfaceNormal,
  vec3 p
) {
  return dot(p - surfacePoint, surfaceNormal);
}

mat4 transpose(in mat4 inMatrix) {
   vec4 i0 = inMatrix[0];
   vec4 i1 = inMatrix[1];
   vec4 i2 = inMatrix[2];
   vec4 i3 = inMatrix[3];

   mat4 outMatrix = mat4(
                   vec4(i0.x, i1.x, i2.x, i3.x),
                   vec4(i0.y, i1.y, i2.y, i3.y),
                   vec4(i0.z, i1.z, i2.z, i3.z),
                   vec4(i0.w, i1.w, i2.w, i3.w)
                   );
  return outMatrix;
}

vec3 reflectedLight(
  vec3 normal,
  vec3 lightDirection,
  vec3 ambient,
  vec3 diffuse
) {
  float brightness = dot(normal, lightDirection);
  return ambient + diffuse * max(brightness, 0.0);
}

void main() {

    // TODO why transpose ??
    vec4 temp = transpose(inverseModel*inverseView)*vec4(normal,0);

    vColor = reflectedLight(vec3(temp.x,temp.y,temp.z),lightDirection,ambient,diffuse);;

  gl_Position = projection*view*model*vec4(position, 1);
}
