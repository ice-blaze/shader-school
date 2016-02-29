precision mediump float;

bool isInTile(vec2 p, const float tileSize){
    vec2 vTile = vec2(tileSize,tileSize);
    p = mod(p,tileSize*2.);

    // return false;
    return (all(greaterThan(p,vTile)) || all(lessThan(p,vTile)));
}

void main() {

    // impossibility to operate on vector, it's like if there are constant

    vec2 tileSize = vec2(16.,16.);
    vec2 point = mod(gl_FragCoord.xy,32.);
    if(isInTile(gl_FragCoord.xy,16.)){
        gl_FragColor = vec4(1.,1.,1.,1.);
    } else {
        discard;
    }
}
