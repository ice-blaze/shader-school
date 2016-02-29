void sideLengths(
  highp float hypotenuse,
  highp float angleInDegrees,
  out highp float opposite,
  out highp float adjacent) {


  //TODO: Calculate side lengths here
  precision highp float;
  const float PI = 3.14159265359;

  angleInDegrees = radians(angleInDegrees);

  adjacent = cos(angleInDegrees)*hypotenuse;
  opposite = sin(angleInDegrees)*hypotenuse;

}

//Do not change this line
#pragma glslify: export(sideLengths)
