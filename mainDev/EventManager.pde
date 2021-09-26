// MouseLocked prevents multiple events to be detected at once : once the mouse is locked, no other action will be triggered after the first one, while the same keys are pressed
boolean mouseLocked = false;

int elementInFocusID = -1;

boolean noElementInFocus = true;
boolean elementInFocusIsPlayerTeam1 = false;
boolean elementInFocusIsPlayerTeam2 = false;
boolean ballInFocus = false;

boolean baseArrowLocked = false;
float baseArrowX;
float baseArrowY;
Arrow arrow;

int teamInWhichPlayerIsBeingAdded;

void runEventManager() {

	// Souris sur canvas
	if(mouseOverCanvas()) {


		/*
		SUPPRESSION D'ELEMENT
		*/
		if (keyPressed && (key == 'z') && !mouseLocked) {
			if(mousePressed) {
				// Did we click on a player ?
				for(int i = 0; i < team1.size(); i++) {
					if(team1.get(i).overPlayer(mouseX, mouseY)) {
						team1FreeJerseyNumbers.add(team1.get(i).getNumber());
						team1.remove(i);
						break;
					}
				}

				for(int i = 0; i < team2.size(); i++) {
					if(team2.get(i).overPlayer(mouseX, mouseY)) {
						team2FreeJerseyNumbers.add(team2.get(i).getNumber());
						team2.remove(i);
						break;
					}
				}


				// Did we click on an arrow ?
				for(int i = 0; i < arrows.size(); i++) {
					if(arrows.get(i).overArrow(mouseX, mouseY)) {
						arrows.remove(i);
						break;
					}
				}



				mouseLocked = true;
			}
		}


		/*
		CREATION FLECHE
		*/
		else if (keyPressed && (key == 's') && !mouseLocked) {
			if(mousePressed) {
				if(!baseArrowLocked) {
					baseArrowX = mouseX;
					baseArrowY = mouseY;
				}

				baseArrowLocked = true;
				Arrow arrow = new Arrow(baseArrowX, baseArrowY, mouseX, mouseY);
				arrow.drawArrow();

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
}


// Souris hors du canvas
else {



}


// Souris sur ou hors canvas

}

void mouseReleased() {

	boolean spotTaken = false;

	/*
	CREATION DE JOUEURS
	*/
	if (keyPressed && (key == 'a')) { // Création joueur équipe 1

		for(int i = 0; i < team1.size(); i++) {
			if(team1.get(i).overPlayer(mouseX, mouseY)) { // Si un joueur de la même équipe est déjà à ces coordonnées
				spotTaken = true;
			}
		}

		if(!spotTaken) {
			computeNextJerseyNumber(1);
			team1.add(new Player("Joueur " + team1NextJerseyNumber, 1, team1NextJerseyNumber, mouseX, mouseY));
			team1JerseyNumbers.add(team1NextJerseyNumber);
			mouseLocked = true;
			teamInWhichPlayerIsBeingAdded = 1;
			saved = "Joueur " + team1NextJerseyNumber;
			INPUTMODE = true;
		}
	} else if (keyPressed && (key == 'e') && !mouseLocked) { // Création joueur équipe 2

		for(int i = 0; i < team2.size(); i++) {
			if(team2.get(i).overPlayer(mouseX, mouseY)) { // Si un joueur de la même équipe est déjà à ces coordonnées
				spotTaken = true;
			}
		}

		if(!spotTaken) {
			computeNextJerseyNumber(2);
			team2.add(new Player("Joueur " + team2NextJerseyNumber, 2, team2NextJerseyNumber, mouseX, mouseY));
			team2JerseyNumbers.add(team2NextJerseyNumber);
			mouseLocked = true;
			teamInWhichPlayerIsBeingAdded = 2;
			saved = "Joueur " + team2NextJerseyNumber;
			INPUTMODE = true;
		}
	}


	/*
	DESSIN FLECHE
	*/
	else if (keyPressed && (key == 's') && !mouseLocked) {
		arrows.add(new Arrow(baseArrowX, baseArrowY, mouseX, mouseY));

		mouseLocked = true;
	}




	/*
	RESET DES CONTROLES
	*/
	mouseLocked = false;
	noElementInFocus = true;
	elementInFocusIsPlayerTeam1 = false;
	elementInFocusIsPlayerTeam2 = false;
	ballInFocus = false;

	baseArrowLocked = false;

	/*
	RECALCUL DES ID ET AUTRES NOMBRES
	*/
	elementInFocusID = -1;
}

void computeNextJerseyNumber(int team) {

	Collections.sort(team1FreeJerseyNumbers);
	Collections.sort(team2FreeJerseyNumbers);
	Collections.sort(team1JerseyNumbers);
	Collections.sort(team2JerseyNumbers);

	switch (team) {
		case 1:
		if (team1JerseyNumbers.size() == 0) { team1NextJerseyNumber = 1; team1JerseyNumbers.add(team1NextJerseyNumber); }
		else if (team1FreeJerseyNumbers.size() != 0) { team1NextJerseyNumber = team1FreeJerseyNumbers.get(0); team1FreeJerseyNumbers.remove(0);}
		else { team1NextJerseyNumber = team1JerseyNumbers.get(team1JerseyNumbers.size()-1); team1NextJerseyNumber++;}
		break;
		case 2:
		if (team2JerseyNumbers.size() == 0) { team2NextJerseyNumber = 1; team2JerseyNumbers.add(team2NextJerseyNumber); }
		else if (team2FreeJerseyNumbers.size() != 0) { team2NextJerseyNumber = team2FreeJerseyNumbers.get(0); team2FreeJerseyNumbers.remove(0);}
		else { team2NextJerseyNumber = team2JerseyNumbers.get(team2JerseyNumbers.size()-1); team2NextJerseyNumber++;}
		break;
	}

}
