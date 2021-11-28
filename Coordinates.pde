

float fieldTopLeftCornerX = (width - (ratio*largeurTerrain))/2;
float fieldTopLeftCornerY = (height - (ratio*hauteurTerrain))/2;

float fieldBottomRightCornerX = (ratio*largeurTerrain) + (width-(ratio*largeurTerrain))/2;
float fieldBottomRightCornerY = (ratio*hauteurTerrain) + (height-(ratio*hauteurTerrain))/2;


float leftGoalTopPostX = fieldTopLeftCornerX;
float leftGoalTopPostY = (fieldTopLeftCornerY+fieldBottomRightCornerY)/2 - ((ratio*7.3)/2);

float leftGoalBottomPostX = fieldTopLeftCornerX;
float leftGoalBottomPostY = (fieldTopLeftCornerY+fieldBottomRightCornerY)/2 + ((ratio*7.3)/2);


float rightGoalTopPostX = fieldBottomRightCornerX;
float rightGoalTopPostY = (fieldTopLeftCornerY+fieldBottomRightCornerY)/2 - ((ratio*7.3)/2);

float rightGoalBottomPostX = fieldBottomRightCornerX;
float rightGoalBottomPostY = (fieldTopLeftCornerY+fieldBottomRightCornerY)/2 + ((ratio*7.3)/2);


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
