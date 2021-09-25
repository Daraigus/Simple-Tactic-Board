import java.util.Collections;

final int ratio = 13;
final float largeurTerrain = 105;
final float hauteurTerrain = 68;

final color BGCOLOR = color(28, 32, 36);

Field field;

boolean resetCheck = true;
boolean drawGUICheck = false;


void setup() {
  frameRate(240);
  
  fullScreen(1);
  background(255);
  fill(0);

  field = new Field(11);
  
  calculateCoordinates();
  
}



void draw() {
    
  reset();
  field.drawField();
  
  
  
  runEventManager();
  
  
  


}

void reset() {
  background(BGCOLOR); // Background de reset
}
