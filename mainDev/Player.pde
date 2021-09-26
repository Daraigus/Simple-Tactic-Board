class Player
{

  private final float ratio = 35;
  final private float tokenRadius = 1.5*this.ratio;

  private float x,y;

  private String name;
  private color col;
  private int team;
  private int number;

  private boolean hasBall;

   // name, team, number
  Player(String na, int t, int n, float xx, float yy) {

    if(t == 1)
      this.col = color(0,0,255);
    else
      this.col = color(255,0,0);

    this.name = na;
    this.team = t;
    this.number = n;

    this.x = xx;
    this.y = yy;
  }


  public void drawPlayer() {
    fill(255);
    stroke(this.col);
    circle(this.x, this.y, tokenRadius);
    fill(this.col);
    textAlign(CENTER);
    textSize(30);
    text(this.name, this.x, this.y + tokenRadius);
    textSize(40);
    text(this.number, this.x, this.y+15);
  }

  public void movePlayer(float x, float y) {
    this.setX(x);
    this.setY(y);
  }

  public boolean hasBall(Ball ball) {
    return this.hasBall;
  }

  public void getsBall(Ball ball) {
    this.hasBall = true;
  }

  public void losesBall(Ball ball) {
    this.hasBall = false;
  }


  boolean overPlayer(float x, float y) {
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

	public String getName() {
    return this.name;
  }

	public void setName(String n) {
    this.name = n;
  }

  public int getTeam() {
    return this.team;
  }

  public int getNumber() {
    return this.number;
  }

}
