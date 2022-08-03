class Player
{

  private final float ratio = 35;
  final private float tokenRadius = 1.2*this.ratio;

  private int x,y;

  private String name;
  private color col;
  private int team;
  private int number;

  private boolean hasBall;

   // name, team, number
  Player(String na, int t, int n, int xx, int yy) {

    if(t == 1) {
      this.col = CP.BLUE;
    } else {
      this.col = CP.RED;
    }

    this.name = na;
    this.team = t;
    this.number = n;

    this.x = xx;
    this.y = yy;
  }

  Player(Player p) {
    this.col = p.getColor();

    this.name = p.getName();
    this.team = p.getTeam();
    this.number = p.getNumber();

    this.x = p.getX();
    this.y = p.getY();
  }


  public void drawPlayer(ColorPicker CP) {

    // Contour blanc et noir
    ellipseMode(CENTER);
    fill(CP.WHITE);
    strokeWeight(3);
    stroke(this.col);
    circle(this.x, this.y, tokenRadius);

    // Player Name
    fill(CP.WHITE);
    textAlign(CENTER);
    textSize(25);
    text(this.name.toUpperCase(), this.x, this.y + tokenRadius);

    // Jersey Number
    fill(this.col);
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

  public float getTokenRadius() {
    return this.tokenRadius;
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
