precision highp float;

uniform float theta;

attribute vec2 position;

//version http://stackoverflow.com/questions/2259476/rotating-a-point-about-another-point-2d
vec2 rotate(vec2 p, vec2 c, float angle){
    float si = sin(angle);
    float co = cos(angle);

    p -= c;

    // rotate point
    vec2 rotated = vec2(p.x*co-p.y*si, p.x*si+p.y*co);
    p = rotated+c;
    return p;
}

vec2 rotateMat(vec2 p, vec2 c, float angle){
    mat2 rotMat = mat2( cos(angle),  sin(angle),
                        -sin(angle), cos(angle));

    return rotMat*p;
}

void main() {

  //TODO: rotate position by theta radians about the origin
    vec2 rotated = rotateMat(position, vec2(0.0), theta);
    gl_Position = vec4(rotated, 1, 1.0);
}
