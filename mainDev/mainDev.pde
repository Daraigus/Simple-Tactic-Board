import java.util.Collections;
import java.util.Random;

final int ratio = 13;
final float largeurTerrain = 105;
final float hauteurTerrain = 68;

final color BGCOLOR = color(28, 32, 36);
final color PINGCOLOR = color(255,0,0);


Field field;

boolean resetCheck = true;
boolean drawGUICheck = false;

int team1NextJerseyNumber;
int team2NextJerseyNumber;
ArrayList<Integer> team1JerseyNumbers;
ArrayList<Integer> team2JerseyNumbers;
ArrayList<Integer> team1FreeJerseyNumbers;
ArrayList<Integer> team2FreeJerseyNumbers;

ArrayList<Player> team1;
ArrayList<Player> team2;

ArrayList<Arrow> arrows;

Ball ball;


void setup() {
  frameRate(60);
  
  fullScreen(1);
  background(255);
  fill(0);

  field = new Field(11);
  
  computeCoordinates();
  
  team1 = new ArrayList<Player>();
  team2 = new ArrayList<Player>();
  
  team1JerseyNumbers = new ArrayList<Integer>();
  team2JerseyNumbers = new ArrayList<Integer>();
  team1FreeJerseyNumbers = new ArrayList<Integer>();
  team2FreeJerseyNumbers = new ArrayList<Integer>();
  
  arrows = new ArrayList<Arrow>();
  
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

void drawArrows() {
  for(int i = 0; i < arrows.size(); i++) {
    arrows.get(i).drawArrow();
  }
}
