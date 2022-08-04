class Field {

  private float x1 = fieldTopLeftCornerX;
  private float y1 = fieldTopLeftCornerY;
  private float x2 = fieldBottomRightCornerX;
  private float y2 = fieldBottomRightCornerY;

  private float fieldLength;
  private float fieldWidth;

  private color brightStripeColor = CP.BRIGHTSTRIPECOLOR;
  private color darkStripeColor = CP.DARKSTRIPECOLOR;

  private int nbStripes;


  Field(int nbS) {
    this.nbStripes = nbS;
  }


  public void drawField() {

		strokeWeight(4);

    this.drawStripes();

    this.drawFieldElements();
  }

  public void drawStripes() {

    float stripesLength = this.y2 - this.y1;
    float stripesWidth = (this.x2 - this.x1)/this.nbStripes;

    rectMode(CORNER);
    noStroke();

    for(int i = 0; i < this.nbStripes; i++) {
      if (i%2 == 0){
        stroke(brightStripeColor);
        fill(brightStripeColor);
      } else {
        stroke(darkStripeColor);
        fill(darkStripeColor);
      }
      rect(this.x1 + (i*stripesWidth), this.y1, stripesWidth, stripesLength);
    }

  }

  public void drawFieldElements() {
    noFill();
    strokeWeight(3);
    stroke(255);

    rect(this.x1, this.y1, ratio*largeurTerrain, ratio*hauteurTerrain); // Play area

    line((this.x1 + this.x2)/2, this.y1, (this.x1 + this.x2)/2, this.y2); // Middle
    //stroke(255,0,0);
    //line(this.x1, (this.y1+this.y2)/2, this.x2, (this.y1+this.y2)/2); // TEMP LINE
    //stroke(255);

    strokeWeight(3);
    ellipseMode(CENTER);
    circle((this.x1 + this.x2)/2, (this.y1 + this.y2)/2, ratio*((9.15*2)*heightScaling)); // Middle Circle

    rect(this.x1, (this.y1+this.y2)/2 - (ratio*(40.3*heightScaling))/2, ratio*(16.5*widthScaling), ratio*(40.3*heightScaling)); // Left penalty area
    rect(this.x2, (this.y1+this.y2)/2 - (ratio*(40.3*heightScaling))/2, -ratio*(16.5*widthScaling), ratio*(40.3*heightScaling)); // Right penalty area

    rect(this.x1, (this.y1+this.y2)/2 - ((ratio*(18.3*heightScaling))/2), ratio*(5.5*widthScaling), ratio*(18.3*heightScaling)); // Left box area
    rect(this.x2, (this.y1+this.y2)/2 - ((ratio*(18.3*heightScaling))/2), -ratio*(5.5*widthScaling), ratio*(18.3*heightScaling)); // Right box area

    rect(this.x1, (this.y1+this.y2)/2 - ((ratio*(7.3*heightScaling))/2), -ratio*(2.4*widthScaling), ratio*(7.3*heightScaling)); // Left Goal
    rect(this.x2, (this.y1+this.y2)/2 - ((ratio*(7.3*heightScaling))/2), ratio*(2.4*widthScaling), ratio*(7.3*heightScaling)); // Right Goal
  }

  public boolean isInside(float xx, float yy) {
    if (xx >= x1 && xx <= x2 && yy >= y1 && yy <= y2)
      return true;
    return false;
  }

  public boolean isInLeftGoal(float xx, float yy) {
    if (xx < x1 && xx > x1-ratio*2.4 && yy > (this.y1+this.y2)/2 - ((ratio*7.3)/2) && yy < (this.y1+this.y2)/2 + ((ratio*7.3)/2))
      return true;
    return false;
  }

  public boolean isInRightGoal(float xx, float yy) {
    if (xx > x2 && xx < x2+ratio*2.4 && yy > (this.y1+this.y2)/2 - ((ratio*7.3)/2) && yy < (this.y1+this.y2)/2 + ((ratio*7.3)/2))
      return true;
    return false;
  }




  // GETTERS SETTERS

}
