// APPROX EQUAL
boolean approximatelyEqual(float desiredValue, float actualValue, float tolerancePercentage) {
    float diff = Math.abs(desiredValue - actualValue);         //  1000 - 950  = 50
    float tolerance = tolerancePercentage/100 * desiredValue;  //  20/100*1000 = 200
    return diff < tolerance;                                   //  50<200      = true
}

// FORMES GEOMETRIQUES
void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}

void hexagon(float x, float y, float radius) {
  polygon(x, y, radius, 6);
}

void pentagon(float x, float y, float radius) {
  polygon(x, y, radius, 5);
}



// TESTS POSITION SOURIS
boolean overMyWindow() {
  if ( (mouseX > 2) && (mouseX <= width -2) && (mouseY > 2)  && (mouseY <= height -2) )   return true;
  return false;
}

boolean mouseOverCanvas() {
  if(mouseX < width*0.9 && mouseY < height*0.9)    return true;
  return false;
}


// CALCULS DE COORDONNEES
float[] getRectCenter(float x, float y, float rectWidth, float rectHeight){
  float[] res = new float[2];
  res[0] = (x + x+rectWidth)/2;
  res[1] = (y + y+rectHeight)/2;
  return res;
}
