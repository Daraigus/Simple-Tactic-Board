
float fieldTopLeftCornerX;
float fieldTopLeftCornerY;

float fieldBottomRightCornerX;
float fieldBottomRightCornerY;


float leftGoalTopPostX;
float leftGoalTopPostY;

float leftGoalBottomPostX;
float leftGoalBottomPostY;


float rightGoalTopPostX;
float rightGoalTopPostY;

float rightGoalBottomPostX;
float rightGoalBottomPostY;

void computeCoordinates() {
  
  fieldTopLeftCornerX = (width - (ratio*largeurTerrain))/2;
  fieldTopLeftCornerY = (height - (ratio*hauteurTerrain))/2;
  
  fieldBottomRightCornerX = (ratio*largeurTerrain) + (width-(ratio*largeurTerrain))/2;
  fieldBottomRightCornerY = (ratio*hauteurTerrain) + (height-(ratio*hauteurTerrain))/2;
  
  
  leftGoalTopPostX = fieldTopLeftCornerX;
  leftGoalTopPostY = (fieldTopLeftCornerY+fieldBottomRightCornerY)/2 - ((ratio*7.3)/2);
  
  leftGoalBottomPostX = fieldTopLeftCornerX;
  leftGoalBottomPostY = (fieldTopLeftCornerY+fieldBottomRightCornerY)/2 + ((ratio*7.3)/2);
  
  
  rightGoalTopPostX = fieldBottomRightCornerX;
  rightGoalTopPostY = (fieldTopLeftCornerY+fieldBottomRightCornerY)/2 - ((ratio*7.3)/2);
  
  rightGoalBottomPostX = fieldBottomRightCornerX;
  rightGoalBottomPostY = (fieldTopLeftCornerY+fieldBottomRightCornerY)/2 + ((ratio*7.3)/2);
    
}

void initScaling(float width, float height) {
  // System.out.print(width + " " + height + "\n");
	widthScaling = width/1920;
	heightScaling = height/1080;
  largeurTerrain = 105*widthScaling;
  hauteurTerrain = 68*heightScaling;
	// System.out.print(widthScaling + " " + heightScaling + "\n");
}