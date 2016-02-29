vec2 bisector(vec2 a, vec2 b) {
  return normalize(length(b) * a + length(a) * b);
}

highp vec2 func(highp vec2 a, highp vec2 b) {

  //TODO: Implement the exercise here
  highp vec2 c = bisector(a,b);
  return c;
  // vec2(, 0);
}

//Do not change this line
#pragma glslify: export(func)
