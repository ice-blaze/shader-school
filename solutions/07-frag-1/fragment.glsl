precision highp float;

#define CIRCLE_COLOR    vec4(1.0, 0.4313, 0.3411, 1.0)
#define OUTSIDE_COLOR   vec4(0.3804, 0.7647, 1.0, 1.0)

bool isInCircle(vec2 p, vec2 c, float r) {
  p -= c;
  return p.x*p.x+p.y*p.y <= r*r;
  // probably slower version because there is a square root
  // return length(p) <= r
}

void main() {

    //  Replace this with a function that draws a circle at (256.5,256.5) with radius 128
    vec2 c = vec2(256.5,256.5);
    float r = 128.;

    if(isInCircle(gl_FragCoord.xy, c, r)) {
        gl_FragColor = CIRCLE_COLOR;
    } else {
        gl_FragColor = OUTSIDE_COLOR;
    }
}
