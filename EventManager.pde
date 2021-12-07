// MouseLocked prevents multiple events to be detected at once : once the mouse is locked, no other action will be triggered after the first one, while the same keys are pressed
boolean mouseLocked = false;

int elementInFocusID = -1;

boolean noElementInFocus = true;
boolean elementInFocusIsPlayerTeam1 = false;
boolean elementInFocusIsPlayerTeam2 = false;
boolean ballInFocus = false;

// Moving Lines
int lineInFocusID = -1;
int memoryX1 = -1;
int memoryY1 = -1;
int memoryX2 = -1;
int memoryY2 = -1;
int memoryMouseX = -1;
int memoryMouseY = -1;

boolean baseArrowLocked = false;
int baseArrowX;
int baseArrowY;
Arrow arrow;

boolean baseLineLocked = false;
int baseLineX;
int baseLineY;
Line line;

boolean baseRectLocked = false;
int baseRectX;
int baseRectY;
Rect rect;

int teamInWhichPlayerIsBeingAdded;
boolean edition = false;
int playerToSetNameID;

Player hookLineBase1, hookLineBase2;

void runEventManager() 
{
    if(!INPUTMODE) 
    {

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

                // Did we click on an line ?
                for(int i = 0; i < lines.size(); i++) {
                    if(lines.get(i).overLine(mouseX, mouseY)) {
                        lines.remove(i);
                        break;
                    }
                }

                // Did we click on an rect ?
                for(int i = 0; i < rects.size(); i++) {
                    if(rects.get(i).overRect(mouseX, mouseY)) {
                        rects.remove(i);
                        break;
                    }
                }



                mouseLocked = true;
            }
        }

        /*
        RENOMME JOUEUR
        */
        else if (keyPressed && (key == 'r') && !mouseLocked) {
            if(mousePressed) {
                // Did we click on a player ?
                for(int i = 0; i < team1.size(); i++) {
                    if(team1.get(i).overPlayer(mouseX, mouseY)) {
                        mouseLocked = true;
                        teamInWhichPlayerIsBeingAdded = 1;
                        saved = "Joueur " + team1.get(i).getNumber();
                        edition = true;
                        playerToSetNameID = i;
                        INPUTMODE = true;
                        break;
                    }
                }

                for(int i = 0; i < team2.size(); i++) {
                    if(team2.get(i).overPlayer(mouseX, mouseY)) {
                        mouseLocked = true;
                        teamInWhichPlayerIsBeingAdded = 2;
                        saved = "Joueur " + team2.get(i).getNumber();
                        edition = true;
                        playerToSetNameID = i;
                        INPUTMODE = true;
                        break;
                    }
                }
            }
        }


        /*
        CREATION ARROW
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
        CREATION LINE
        */
        else if (keyPressed && (key == 'q') && !mouseLocked) {
            if(mousePressed) {
                if(!baseLineLocked) {
                    baseLineX = mouseX;
                    baseLineY = mouseY;
                }

                baseLineLocked = true;
                Line line = new Line(baseLineX, baseLineY, mouseX, mouseY);
                line.drawLine();

                mouseLocked = true;
            }
        }

        /*
        CREATION HOOKLINE
        */
        else if (keyPressed && (key == 'w') && !mouseLocked) {
            if(mousePressed) {
                if(!baseLineLocked) {
                    baseLineX = mouseX;
                    baseLineY = mouseY;
                }

                baseLineLocked = true;
                Line line = new Line(baseLineX, baseLineY, mouseX, mouseY);
                line.drawLine();

                mouseLocked = true;
            }
        }


        /*
        CREATION DASHLINE
        */
        else if (keyPressed && (key == 'x') && !mouseLocked) {
            if(mousePressed) {
                if(!baseLineLocked) {
                    baseLineX = mouseX;
                    baseLineY = mouseY;
                }

                baseLineLocked = true;
                DashLine dashLine = new DashLine(baseLineX, baseLineY, mouseX, mouseY);
                dashLine.drawLine();

                mouseLocked = true;
            }
        }


        /*
        CREATION RECT
        */
        else if (keyPressed && (key == 'd') && !mouseLocked) {
            if(mousePressed) {
                if(!baseRectLocked) {
                    baseRectX = mouseX;
                    baseRectY = mouseY;
                }

                baseRectLocked = true;
                Rect rect = new Rect(baseRectX, baseRectY, mouseX, mouseY);
                rect.drawRect();

                mouseLocked = true;
            }
        }



        /*
        DEPLACEMENT DE JOUEUR OU DU BALLON
        */
        else if(mousePressed && !mouseLocked) { //Si on ne fait que cliquer

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
            } 
            if(noElementInFocus || elementInFocusIsPlayerTeam2) { // Pas d'élément focus ou team2
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

            // Did we click on a line ?
            if(noElementInFocus || lineInFocusID != -1) { // Pas d'élément focus ou ligne
                if(lineInFocusID != -1) { // If the line is already in focus
                    lines.get(lineInFocusID).setX1(lines.get(lineInFocusID).getX1() + (mouseX - memoryMouseX));
                    lines.get(lineInFocusID).setY1(lines.get(lineInFocusID).getY1() + (mouseY - memoryMouseY));
                    lines.get(lineInFocusID).setX2(lines.get(lineInFocusID).getX2() + (mouseX - memoryMouseX));
                    lines.get(lineInFocusID).setY2(lines.get(lineInFocusID).getY2() + (mouseY - memoryMouseY));
                    memoryMouseX = mouseX;
                    memoryMouseY = mouseY;
                    noElementInFocus = false;
                } else {
                    for(int i = 0; i < lines.size(); i++) {
                        if (lines.get(i).overLine(mouseX, mouseY) /*&& !(lines.get(i) instanceOf HookLine)*/) {
                            lineInFocusID = i;
                            memoryMouseX = mouseX;
                            memoryMouseY = mouseY;
                            noElementInFocus = false;
                        }
                    }
                }
            }

            // Did we click on a rect ?
            // if(noElementInFocus || lineInFocusID != -1) { // Pas d'élément focus ou rect
            //     if(lineInFocusID != -1) { // If the rect is already in focus
            //         lines.get(lineInFocusID).setX(mouseX);
            //         lines.get(lineInFocusID).setY(mouseY);
            //     } else {
            //         for(int i = 0; i < lines.getSize(); i++) {
            //             if (lines.get(i).overLine()) {
            //                 lineInFocusID = i;
            //                 lines.get(lineInFocusID).setX(mouseX);
            //                 lines.get(lineInFocusID).setY(mouseY);
            //             }
            //         }
            //     }
            // }

            mouseLocked = true;
        }

        mouseLocked = false;
        

        

    }
        

}

void mouseReleased() {

    if(!INPUTMODE) 
    {

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
                playerToSetNameID = team1.size() - 1;
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
                playerToSetNameID = team2.size() - 1;
                INPUTMODE = true;
            }
        }


        /*
        SAVE ARROW
        */
        else if (keyPressed && (key == 's') && !mouseLocked) {
            if(Math.abs(baseArrowX-mouseX) > 20 || Math.abs(baseArrowY-mouseY) > 20) {
                arrows.add(new Arrow(baseArrowX, baseArrowY, mouseX, mouseY));

                mouseLocked = true;
            }
        }


        /*
        SAVE LINE
        */
        else if (keyPressed && (key == 'q') && !mouseLocked) {
            if(Math.abs(baseLineX-mouseX) > 20 || Math.abs(baseLineY-mouseY) > 20) {
                lines.add(new Line(baseLineX, baseLineY, mouseX, mouseY));

                mouseLocked = true;
            }
        }


        /*
        SAVE HOOKLINE
        */
        else if (keyPressed && (key == 'w') && !mouseLocked) {
            hookLineBase1 = playerHovered(baseLineX, baseLineY);
            hookLineBase2 = playerHovered(mouseX, mouseY);
            
            if(hookLineBase1 != null && hookLineBase2 != null) {
                lines.add(new HookLine(hookLineBase1, hookLineBase2));
            }

            mouseLocked = true;
        }


        /*
        SAVE DASHLINE
        */
        else if (keyPressed && (key == 'x') && !mouseLocked) {
            if(Math.abs(baseLineX-mouseX) > 20 || Math.abs(baseLineY-mouseY) > 20) {
                lines.add(new DashLine(baseLineX, baseLineY, mouseX, mouseY));

                mouseLocked = true;
            }
        }


        /*
        SAVE RECT
        */
        else if (keyPressed && (key == 'd') && !mouseLocked) {
            rects.add(new Rect(baseRectX, baseRectY, mouseX, mouseY));

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
        
        lineInFocusID = -1;
        memoryX1 = -1;
        memoryY1 = -1;
        memoryX2 = -1;
        memoryY2 = -1;
        memoryMouseX = -1;
        memoryMouseX = -1;

        baseArrowLocked = false;
        baseLineLocked = false;
        baseRectLocked = false;

        /*
        RECALCUL DES ID ET AUTRES NOMBRES
        */
        elementInFocusID = -1;

    }

	
}

Player playerHovered(int x, int y) {
    for(int i = 0; i < team1.size(); i++) {
        if(team1.get(i).overPlayer(x, y)) {
            return team1.get(i);
        }
    }

    for(int i = 0; i < team2.size(); i++) {
        if(team2.get(i).overPlayer(x, y)) {
            return team2.get(i);
        }
    }

    return null;
}

void computeNextJerseyNumber(int team) {

    // print("Team : " + team);

	Collections.sort(team1FreeJerseyNumbers);
	Collections.sort(team2FreeJerseyNumbers);
	Collections.sort(team1JerseyNumbers);
	Collections.sort(team2JerseyNumbers);

    if(!edition) {
        switch (team) {
            case 1:
            if (team1JerseyNumbers.size() == 0) { team1NextJerseyNumber = 1; team1JerseyNumbers.add(team1NextJerseyNumber);}
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

    // print(" - Num : " + team1NextJerseyNumber + edition + playerToSetNameID + "\n");

}
