
// Variable to store text currently being typed
String typing = "";

// Variable to store saved text when return is hit
String saved = "";

int indent = 25;


void runInputMode() {

  fill(255);

  // Display everything
  text("Nom du joueur: \n" + typing,width/2, height/2);
}

void keyPressed() {

	if(INPUTMODE) {
		// If the return key is pressed, save the String and clear it
	  if (key == '\n' ) {
			if (typing != "") {
				saved = typing;
			}
	    typing = "";

			if(teamInWhichPlayerIsBeingAdded == 1) {
				computeNextJerseyNumber(1);
				team1.get(playerToEdit).setName(saved);
			} else if(teamInWhichPlayerIsBeingAdded == 2) {
				computeNextJerseyNumber(2);
				team2.get(playerToEdit).setName(saved);
			}

			teamInWhichPlayerIsBeingAdded = -1;
			saved = "";
			INPUTMODE = false;
	  } else if (key == BACKSPACE) {
			if (typing.length()>0) typing = typing.substring(0,typing.length()-1);
			else typing = saved;
		} else if (key == CODED) { // Ignore shift/control/tab
			typing = typing;
		} else {
	    typing = typing + key;
	  }
	}

}
