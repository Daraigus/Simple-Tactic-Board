class Ball 
{
  
  final private float tokenRadius = 1.5*ratio;
  
  private float x,y;

  private color col;
  
 
  Ball(color c, float xx, float yy) {
    this.col = c;
    this.x = xx;
    this.y = yy;
  }
  
  
  public void drawBall() {
    fill(this.col);
    strokeWeight(2);
    stroke(0);
    circle(this.x, this.y,tokenRadius);
  }
  
  
  public boolean isInRange(float xx, float yy, float range) {
    if(this.x > xx - range*ratio && this.x < xx + range*ratio && this.y > yy - range*ratio && this.y < yy + range*ratio) {
      return true;
    }
    return false;
  }
  
  boolean overBall(float x, float y) {
    if ( (x > this.x - (this.tokenRadius/2)) && (x < this.x + (this.tokenRadius/2)) && (y > this.y - (this.tokenRadius/2))  && (y < this.y + (this.tokenRadius/2)) )   return true;
    return false;
  }
  

  // GETTERS SETTERS
  public float getX() {
    return this.x;
  }
  
  public float getY() {
    return this.y;
  }
  
  public void setX(float xx) {
    this.x = xx;
  }
  
  public void setY(float yy) {
    this.y = yy;
  }
  

  public color getColor() {
    return this.col;
  }
  
  public void setColor(color c) {
    this.col = c;
  }

  
}
