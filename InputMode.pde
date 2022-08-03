
// Variable to store text currently being typed
String typing = "";

// Variable to store saved text when return is hit
String saved = "";

int indent = 25;


void runInputMode() {

	fill(255);

	// Display everything
	if(INPUTPLAYER) {
		if(teamInWhichPlayerIsBeingAdded == 1) {
			text("Nom du joueur : \n\n" + typing.toUpperCase(), 
			team1.get(playerToSetNameID).getX(), 
			team1.get(playerToSetNameID).getY()-team1.get(playerToSetNameID).getTokenRadius()/1.5);
		} else if(teamInWhichPlayerIsBeingAdded == 2) {
			text("Nom du joueur : \n\n" + typing.toUpperCase(), 
			team2.get(playerToSetNameID).getX(), 
			team2.get(playerToSetNameID).getY()-team2.get(playerToSetNameID).getTokenRadius()/1.5);
		}
  	} else if (INPUTTEXT) {
	  	text("Texte libre : \n" + typing.toUpperCase(), 
		texts.get(textToEditID).getX(), 
		texts.get(textToEditID).getY()-indent);
  	}
  
}

void keyPressed() {

	if (key == ESC) {
        key = '\n';  // Prevents killing the window with ESC + leaves INPUTMODE
    }

	if(INPUTMODE) {
		// If the return key (or ESC) is pressed, save the String and clear it
		if (key == '\n' ) {
				if (typing != "") {
					saved = typing;
				}
				typing = "";

				if(INPUTPLAYER) {
					if(teamInWhichPlayerIsBeingAdded == 1) {
						team1.get(playerToSetNameID).setName(saved.toUpperCase());
					} else if(teamInWhichPlayerIsBeingAdded == 2) {
						team2.get(playerToSetNameID).setName(saved.toUpperCase());
					}
				} else if (INPUTTEXT) {
					texts.get(textToEditID).setTxt(saved);
				}
				

				teamInWhichPlayerIsBeingAdded = -1;
				saved = "";
				edition = false;
				mouseLocked = false;
				INPUTMODE = false;
				INPUTPLAYER = false;
				INPUTTEXT = false;
		} else if (key == BACKSPACE) {
				if (typing.length()>0) typing = typing.substring(0,typing.length()-1);
				else typing = saved;
			} else if (key == CODED) { // Ignore shift/control/tab
				typing = typing.toUpperCase();
			} else {
			typing = typing + key;
		}
	}

}
