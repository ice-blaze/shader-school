precision mediump float;

attribute vec3 position;
uniform mat4 model, view, projection;
uniform vec3 ambient;

float lambertWeight(vec3 n, vec3 d) {
  return max(dot(n, d), 0.0);
}

void main() {
  gl_Position = projection*view*model*vec4(position, 1);
}
