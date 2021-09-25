// MouseLocked prevents multiple events to be detected at once : once the mouse is locked, no other action will be triggered after the first one, while the same keys are pressed
boolean mouseLocked = false;

int elementInFocusID = -1;

boolean noElementInFocus = true;
boolean elementInFocusIsPlayerTeam1 = false;
boolean elementInFocusIsPlayerTeam2 = false;
boolean ballInFocus = false;

void runEventManager() {

  // Souris sur canvas
  if(mouseOverCanvas()) {
    
    
    
    if (keyPressed && (key == 'z') && !mouseLocked) { // Suppression élément
      if(mousePressed) {
        // Did we click on a player ?
        for(int i = 0; i < team1.size(); i++) {
          if(team1.get(i).overPlayer(mouseX, mouseY)) {
            team1.remove(i);
            break;
          }
        }
  
        for(int i = 0; i < team2.size(); i++) {
          if(team2.get(i).overPlayer(mouseX, mouseY)) {
            team2.remove(i);
            break;
          }
        }
        mouseLocked = true;
      }
    } 
    
    
    /* 
    DEPLACEMENT DE JOUEUR OU DU BALLON
    */
    else if(mousePressed  && !mouseLocked) { //Si on ne fait que cliquer
    
      // Did we click on a player ?
      if(noElementInFocus || elementInFocusIsPlayerTeam1) { // Pas d'élément focus ou team1
        if(elementInFocusIsPlayerTeam1) { // si team 1
          team1.get(elementInFocusID).setX(mouseX);
          team1.get(elementInFocusID).setY(mouseY);
        } else { // si rien de focus
          for(int i = 0; i < team1.size(); i++) {
            if(team1.get(i).overPlayer(mouseX, mouseY)) {
              team1.get(i).setX(mouseX);
              team1.get(i).setY(mouseY);
              noElementInFocus = false;
              elementInFocusIsPlayerTeam1 = true;
              elementInFocusID = i;
            }
          }
        }
      } if(noElementInFocus || elementInFocusIsPlayerTeam2) { // Pas d'élément focus ou team2
        if(elementInFocusIsPlayerTeam2) { // si team 2
          team2.get(elementInFocusID).setX(mouseX);
          team2.get(elementInFocusID).setY(mouseY);
        } else {
          for(int i = 0; i < team2.size(); i++) {
            if(team2.get(i).overPlayer(mouseX, mouseY)) {
              team2.get(i).setX(mouseX);
              team2.get(i).setY(mouseY);
              noElementInFocus = false;
              elementInFocusIsPlayerTeam2 = true;
              elementInFocusID = i;
            }
          }
        }
      }
      
      
      // Did we click on the ball ?
      if(noElementInFocus || ballInFocus) { // Pas d'élément focus ou ballon
        if(ballInFocus) { // If the ball is already in focus
          ball.setX(mouseX);
          ball.setY(mouseY);
        }
        if(ball.overBall(mouseX, mouseY)) {
          ball.setX(mouseX);
          ball.setY(mouseY);
          noElementInFocus = false;
          ballInFocus = true;
        }
      }
      
      
      
      mouseLocked = true;
    }
    
    mouseLocked = false;
    print(team1.size() + "   " + team2.size() + "\n");
  } 
  
    
  // Souris hors du canvas
  else { 
    
    
    
  }
  
  
  // Souris sur ou hors canvas
  
}

void mouseReleased() {
  
  /* 
  CREATION DE JOUEURS
  */
  if (keyPressed && (key == 'a')) { // Création joueur équipe 1
    boolean spotTaken = false;
    for(int i = 0; i < team1.size(); i++) {
      if(team1.get(i).overPlayer(mouseX, mouseY)) { // Si un joueur de la même équipe est déjà à ces coordonnées
        spotTaken = true;
      }
    }
    
    if(!spotTaken) {
      team1JerseyNumber++;
      team1.add(new Player("nn", 1, mouseX, mouseY));
      mouseLocked = true;
    }
  } else if (keyPressed && (key == 'e') && !mouseLocked) { // Création joueur équipe 2
  
    boolean spotTaken = false;
    for(int i = 0; i < team2.size(); i++) {
      if(team2.get(i).overPlayer(mouseX, mouseY)) { // Si un joueur de la même équipe est déjà à ces coordonnées
        spotTaken = true;
      }
    }
    
    if(!spotTaken) {
      team2JerseyNumber++;
      team2.add(new Player("nn", 2, mouseX, mouseY));
      mouseLocked = true;
    }
  }
  
  
  
  
  /* 
  RESET DES CONTROLES
  */
  mouseLocked = false;
  noElementInFocus = true;
  elementInFocusIsPlayerTeam1 = false;
  elementInFocusIsPlayerTeam2 = false;
  ballInFocus = false;
  
  elementInFocusID = -1;
}
