precision mediump float;

uniform mat4 model, view, projection;
uniform vec3 ambient;


void main() {
    const float c = 0.25;
  gl_FragColor = vec4(c,c,c,c);
}
