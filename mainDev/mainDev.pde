import java.util.Collections;

final int ratio = 13;
final float largeurTerrain = 105;
final float hauteurTerrain = 68;

final color BGCOLOR = color(28, 32, 36);
final color ARROWCOLOR = color(45, 120, 255);
final color PINGCOLOR = color(255,0,0);


Field field;

boolean resetCheck = true;
boolean drawGUICheck = false;

int team1JerseyNumber;
int team2JerseyNumber;

ArrayList<Player> team1;
ArrayList<Player> team2;

Ball ball;


void setup() {
  frameRate(60);
  
  fullScreen(1);
  background(255);
  fill(0);

  field = new Field(11);
  
  computeCoordinates();
  
  team1JerseyNumber = 0;
  team2JerseyNumber = 0;
  
  team1 = new ArrayList<Player>();
  team2 = new ArrayList<Player>();
  
  ball = new Ball(255, width/2, height/2);
  
}



void draw() {
    
  reset();
  field.drawField();
  
  drawPlayers();
  ball.drawBall();
  
  
  runEventManager();
  
  

}



void reset() {
  background(BGCOLOR); // Background de reset
}

void drawPlayers() {
  for(int i = 0; i < team1.size(); i++) {
    team1.get(i).drawPlayer();
  }
  
  for(int i = 0; i < team2.size(); i++) {
    team2.get(i).drawPlayer();
  }
}
