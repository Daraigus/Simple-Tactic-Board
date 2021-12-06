class Player
{

  private final float ratio = 35;
  final private float tokenRadius = 1.2*this.ratio;

  private int x,y;

  private String name;
  private color col;
  private color col2;
  private int team;
  private int number;

  private boolean hasBall;

   // name, team, number
  Player(String na, int t, int n, int xx, int yy) {

    if(t == 1) {
      this.col = color(0,0,255);
      this.col2 = color(225);
    } else {
      this.col = color(255,0,0);
      this.col2 = color(225);
    }

    this.name = na;
    this.team = t;
    this.number = n;

    this.x = xx;
    this.y = yy;
  }


  public void drawPlayer() {
    fill(this.col2);
    strokeWeight(3);
    stroke(this.col);
    circle(this.x, this.y, tokenRadius);
    fill(this.col);
    textAlign(CENTER);
    textSize(25);
    text(this.name, this.x, this.y + tokenRadius);
    textSize(30);
    text(this.number, this.x, this.y+10);
  }

  public void movePlayer(int x, int y) {
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


  boolean overPlayer(int x, int y) {
    if ( (x > this.x - (this.tokenRadius/2)) && (x < this.x + (this.tokenRadius/2)) && (y > this.y - (this.tokenRadius/2))  && (y < this.y + (this.tokenRadius/2)) )   return true;
    return false;
  }



  // GETTERS SETTERS
  public int getX() {
    return this.x;
  }

  public int getY() {
    return this.y;
  }

  public void setX(int xx) {
    this.x = xx;
  }

  public void setY(int yy) {
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
