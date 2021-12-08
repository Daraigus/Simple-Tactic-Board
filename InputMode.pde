
// Variable to store text currently being typed
String typing = "";

// Variable to store saved text when return is hit
String saved = "";

int indent = 25;


void runInputMode() {

  fill(255);

  // Display everything
  if(INPUTPLAYER) {
	  text("Nom du joueur : \n" + typing,width/2, height/2);
  } else if (INPUTTEXT) {
	  text("Texte libre : \n" + typing,width/2, height/2);
  }
  
}

void keyPressed() {

	if(INPUTMODE) {
		// If the return key is pressed, save the String and clear it
		if (key == '\n' ) {
				if (typing != "") {
					saved = typing;
				}
				typing = "";

				if(INPUTPLAYER) {
					if(teamInWhichPlayerIsBeingAdded == 1) {
						team1.get(playerToSetNameID).setName(saved);
					} else if(teamInWhichPlayerIsBeingAdded == 2) {
						team2.get(playerToSetNameID).setName(saved);
					}
				} else if (INPUTTEXT) {
					texts.get(textToEditID).setTxt(saved);
				}
				

				teamInWhichPlayerIsBeingAdded = -1;
				saved = "";
				edition = false;
				INPUTMODE = false;
				INPUTPLAYER = false;
				INPUTTEXT = false;
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
