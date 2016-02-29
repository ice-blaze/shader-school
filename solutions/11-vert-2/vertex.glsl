precision highp float;

attribute vec4 position;
attribute vec3 color;

varying vec4 fragPosition;

void main() {
  gl_Position = position;
  fragPosition = vec4(color,1.);
}
