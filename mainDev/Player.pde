class Player 
{
  
  private final float ratio = 13;
  final private float tokenRadius = 1.5*this.ratio;
  
  private float x,y;
  
  private String name;
  private color col;
  private int team;
  private int number;
  
  private boolean hasBall;
  
  private ArrayList<Player> teammates;
  private ArrayList<Player> adversaries;
  
   // name, team, number
  Player(String na, int t, int n) {
    
    if(t == 1)
      this.col = color(0,0,255);
    else
      this.col = color(255,0,0);
    
    this.name = na;
    this.team = t;
    this.number = n;
    
    this.teammates = new ArrayList<Player>();
    this.adversaries = new ArrayList<Player>();
  }
  
  
  public void drawPlayer() {
    fill(this.col);
    stroke(this.col);
    circle(this.x, this.y,tokenRadius);
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
  
  
  public void initAI(ArrayList<Player> players){
    
    //print("\n------ " + this.name + " AI init starting\n");
    
    // Adding other players to teammates and adversaries lists
    for(int i = 0; i < players.size(); i++) {
      if (players.get(i).getTeam() == this.team) {
        if(players.get(i).getName() != this.name) {
          
          this.teammates.add(players.get(i));
        }
      }
      else {
        if(players.get(i).getName() != this.name) {
          this.adversaries.add(players.get(i));
        }
      }
    }
    
    //print("\n------ " + this.name + " AI init ending\n\n");
    
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
  
  public int getTeam() {
    return this.team;
  }
  
  public int getNumber() {
    return this.number;
  }
  
}
