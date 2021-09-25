class Field {

  private float x1 = (width - (ratio*largeurTerrain))/2;
  private float y1 = (height - (ratio*hauteurTerrain))/2;
  private float x2 = (ratio*largeurTerrain) + (width-(ratio*largeurTerrain))/2;
  private float y2 = (ratio*hauteurTerrain) + (height-(ratio*hauteurTerrain))/2;

  private float fieldLength;
  private float fieldWidth;
  
  private color brightStripeColor = color(86,110,72);
  private color darkStripeColor = color(93,120,78);

  private int nbStripes;


  Field(int nbS) {
    this.nbStripes = nbS;
  }


  public void drawField() {

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
    strokeWeight(6);
    stroke(255);

    rect(this.x1, this.y1, ratio*largeurTerrain, ratio*hauteurTerrain); // Play area

    line((this.x1 + this.x2)/2, this.y1, (this.x1 + this.x2)/2, this.y2); // Middle
    //stroke(255,0,0);
    //line(this.x1, (this.y1+this.y2)/2, this.x2, (this.y1+this.y2)/2); // TEMP LINE
    //stroke(255);

    strokeWeight(5);
    circle((this.x1 + this.x2)/2, (this.y1 + this.y2)/2, ratio*(9.15*2)); // Middle Circle

    rect(this.x1, (this.y1+this.y2)/2 - (ratio*40.3)/2, ratio*16.5, ratio*40.3); // Left penalty area
    rect(this.x2, (this.y1+this.y2)/2 - (ratio*40.3)/2, -ratio*16.5, ratio*40.3); // Right penalty area

    rect(this.x1, (this.y1+this.y2)/2 - ((ratio*18.3)/2), ratio*5.5, ratio*18.3); // Left box area
    rect(this.x2, (this.y1+this.y2)/2 - ((ratio*18.3)/2), -ratio*5.5, ratio*18.3); // Right box area

    rect(this.x1, (this.y1+this.y2)/2 - ((ratio*7.3)/2), -ratio*2.4, ratio*7.3); // Left Goal
    rect(this.x2, (this.y1+this.y2)/2 - ((ratio*7.3)/2), ratio*2.4, ratio*7.3); // Right Goal
  }

  public boolean isInside(float xx, float yy) {
    if (xx >= x1 || xx <= x2 || yy >= y1 || yy <= y2)
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
