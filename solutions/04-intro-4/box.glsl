bool inBox(highp vec2 lo, highp vec2 hi, highp vec2 p) {

  //Test if the point p is inside the box bounded by [lo, hi]
  // if(p.x>lo.x && p.x < hi.x && p.y > lo.y && p.y < hi.y){
  //     return true;
  // }
  // return false;

  // Enhance version of Efrank
  return all(bvec2(all(greaterThan(p,lo)), all(lessThan(p,hi))));

  // // WHAT THE FUCK !!!
  // // http://stackoverflow.com/questions/12751080/glsl-point-inside-box-test
  // vec2 s = step(lo,p) - step(hi,p);
  // return all(bvec2(s));
}


//Do not change this line or the name of the above function
#pragma glslify: export(inBox)
