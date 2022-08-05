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

/***
* A method to produce a rounded rectangle. 	
**/
void roundedRect(int left, int top, int width, int height, int roundness)
{
  beginShape();               
  vertex(left + roundness, top);
  vertex(left + width - roundness, top);
  bezierVertex(left + width - roundness, top,
                left + width, top,
                left + width, top + roundness);
                          
  vertex(left + width, top + roundness);
  vertex(left + width, top + height - roundness);
  bezierVertex(left + width, top + height - roundness,
                left + width, top + height,
                left + width - roundness, top + height);
        
  vertex(left + width - roundness, top + height);
  vertex(left + roundness, top + height);        
  bezierVertex(left + roundness, top + height,
                left, top + height,
                left, top + height - roundness);
        
  vertex(left, top + height - roundness);
  vertex(left, top + roundness);
  bezierVertex(left, top + roundness,
                left, top,
                left + roundness, top);        
  endShape();
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

double distance(int x1, int y1, int x2, int y2) {
  return Math.sqrt(((float)x1 - (float)x2)  + ((float)y1 - (float)y2));
}