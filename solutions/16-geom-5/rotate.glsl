vec3 rotatePoint(vec3 p, vec3 n, float theta) {
  return (
    p * cos(theta) + cross(n, p) *
    sin(theta) + n * dot(p, n) *
    (1.0 - cos(theta))
  );
}

highp mat4 rotation(highp vec3 n, highp float theta) {

    // DIDNT WORK !!!!!!!!!!!!!!!!!
    // DIDNT WORK !!!!!!!!!!!!!!!!!
    // DIDNT WORK !!!!!!!!!!!!!!!!!
    // DIDNT WORK !!!!!!!!!!!!!!!!!
    // DIDNT WORK !!!!!!!!!!!!!!!!!
    // DIDNT WORK !!!!!!!!!!!!!!!!!
    // DIDNT WORK !!!!!!!!!!!!!!!!!
    // DIDNT WORK !!!!!!!!!!!!!!!!!
    // DIDNT WORK !!!!!!!!!!!!!!!!!

  //TODO: Using Rodrigues' formula, find a matrix which performs a rotation about the axis n by theta radians
  vec3 rotated = rotatePoint(vec3(1.),n,theta);

  mat4 unitair = mat4(1, 0, 0, 0,
                      0, 1, 0, 0,
                      0, 0, 1, 0,
                      0, 0, 0, 1);

    mat4 one = mat4(cos(theta))*unitair;
    mat4 two = mat4(n.x*n.x,n.x*n.y,n.x*n.z,0,
                    n.x*n.y,n.y*n.y,n.y*n.z,0,
                    n.x*n.z,n.y*n.z,n.z*n.z,0,
                    0,0,0,0);
    // vec4 temp = vec4(1-cos(theta));
                    // mat4(1-cos(theta));
    // two *= mat4(1-cos(theta));
    // mat4 three = mat4(0,n.z,-n.y,0,
    //                   -n.z,0,n.x,0,
    //                   n.y,-n.x,0,0,
    //                   0,0,0,0);
    // three *= mat4(sin(theta));

  return mat4(rotated.x, 0, 0, 0,
              0, rotated.y, 0, 0,
              0, 0, rotated.z, 0,
              0, 0, 0, 1);
}

#pragma glslify: export(rotation)
