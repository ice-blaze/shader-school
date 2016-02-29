precision highp float;

uniform sampler2D texture;
uniform vec2 screenSize;

void main() {
  vec2 coord = gl_FragCoord.xy / screenSize;

  //TODO: Swap red and blue color channels of image

  gl_FragColor = texture2D(texture, coord);
  float temp = gl_FragColor.r;
  gl_FragColor.r = gl_FragColor.b;
  gl_FragColor.b = temp;
}
