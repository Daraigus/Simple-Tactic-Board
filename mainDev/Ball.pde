class Ball 
{
  
  final private float tokenRadius = 1*ratio;
  
  private float x,y;

  private color col;
  
  public float targetX,targetY;
  
 
  Ball(color c) {
    this.col = c;
    this.targetX = width/2;
    this.targetY = height/2;
  }
  
  
  public void drawBall() {
    fill(this.col);
    strokeWeight(1);
    stroke(0);
    circle(this.x, this.y,tokenRadius);
  }
  
  public void moveBall(int x, int y) {
    this.setX(x);
    this.setY(y);
  }  
  
  
  public boolean isInRange(float xx, float yy, float range) {
    if(this.x > xx - range*ratio && this.x < xx + range*ratio && this.y > yy - range*ratio && this.y < yy + range*ratio) {
      return true;
    }
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
