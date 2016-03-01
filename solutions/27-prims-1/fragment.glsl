precision highp float;

varying vec3 vColor;
varying float vSize;

bool isInCircle(){
  float dx = gl_PointCoord.x - 0.5;
  float dy = gl_PointCoord.y - 0.5;
  if( dx*dx + dy*dy >= 0.5*0.5){
    return true;
  }
  return false;
}

void main() {

  if(isInCircle()){
    //set the alpha didn't work for points
    discard;
  }

  gl_FragColor = vec4(vColor,1.);

}
