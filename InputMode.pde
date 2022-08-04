
// Variable to store text currently being typed
String typing = "";

// Variable to store saved text when return is hit
String saved = "";

int indent = (int)(25*heightScaling);

boolean controlDown = false;
boolean shiftDown = false;


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
				lockHisto = false;
				INPUTMODE = false;
				INPUTPLAYER = false;
				INPUTTEXT = false;
				busy = false;
		} else if (key == BACKSPACE) {
			if (typing.length()>0) typing = typing.substring(0,typing.length()-1);
			else typing = saved;
		} else if (key == CODED) { // Ignore shift/control/tab
			if (keyCode == CONTROL)
				controlDown = true;
			if (keyCode == SHIFT)
				shiftDown = true;
		} else if (!controlDown) {
			typing = typing + key;
			if(typing.length() > 50) {
				typing = "T'abuses";
			}
		} else {}
	} else {
		// Remember if CTRL or SHIFT are pressed or not
		if (key == CODED) {
			if (keyCode == CONTROL)
				controlDown = true;
			if (keyCode == SHIFT)
				shiftDown = true;
			return;
		}
		// Check if we pressed CTRL+Z or CTRL+SHIFT+Z
		if (controlDown && !mouseLocked && !busy) {
			if (keyCode == 'Z') {
				if (shiftDown)
					histo.redo();
				else
					histo.undo();
			}
			if (keyCode == 'Y') {
				histo.redo();
			}
			return;
		} 
		if (keyCode == '1' || keyCode == '&') {
			ui.getButtons().get(0).toggle(); // Toggle button ON
			ui.getButtons().get(toggledButtonID).toggle(); // Toggle previous button OFF
			toggledButtonID = 0;      
		} else if (keyCode == '2' || keyCode == 'é') {
			ui.getButtons().get(3).toggle(); // Toggle button ON
			ui.getButtons().get(toggledButtonID).toggle(); // Toggle previous button OFF
			toggledButtonID = 3;      
		} else if (keyCode == '3' || keyCode == '"') {
			ui.getButtons().get(4).toggle(); // Toggle button ON
			ui.getButtons().get(toggledButtonID).toggle(); // Toggle previous button OFF
			toggledButtonID = 4;      
		} else if (keyCode == '4' || keyCode == '\'') {
			ui.getButtons().get(5).toggle(); // Toggle button ON
			ui.getButtons().get(toggledButtonID).toggle(); // Toggle previous button OFF
			toggledButtonID = 5;      
		} else if (keyCode == '5' || keyCode == '(') {
			ui.getButtons().get(6).toggle(); // Toggle button ON
			ui.getButtons().get(toggledButtonID).toggle(); // Toggle previous button OFF
			toggledButtonID = 6;      
		} else if (keyCode == '6' || keyCode == '-') {
			ui.getButtons().get(7).toggle(); // Toggle button ON
			ui.getButtons().get(toggledButtonID).toggle(); // Toggle previous button OFF
			toggledButtonID = 7;      
		} else if (keyCode == '7' || keyCode == 'è') {
			ui.getButtons().get(8).toggle(); // Toggle button ON
			ui.getButtons().get(toggledButtonID).toggle(); // Toggle previous button OFF
			toggledButtonID = 8;      
		} else if (keyCode == '8' || keyCode == '_') {
			ui.getButtons().get(9).toggle(); // Toggle button ON
			ui.getButtons().get(toggledButtonID).toggle(); // Toggle previous button OFF
			toggledButtonID = 9;      
		} else if (keyCode == '9' || keyCode == 'ç') {
			ui.getButtons().get(10).toggle(); // Toggle button ON
			ui.getButtons().get(toggledButtonID).toggle(); // Toggle previous button OFF
			toggledButtonID = 10;      
		} else if (keyCode == '0' || keyCode == 'à') {
			ui.getButtons().get(11).toggle(); // Toggle button ON
			ui.getButtons().get(toggledButtonID).toggle(); // Toggle previous button OFF
			toggledButtonID = 11;      
		} else if (keyCode == ')' || keyCode == '°') {
			ui.getButtons().get(12).toggle(); // Toggle button ON
			ui.getButtons().get(toggledButtonID).toggle(); // Toggle previous button OFF
			toggledButtonID = 12;      
		}
	}

}
