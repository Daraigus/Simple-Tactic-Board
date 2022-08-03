// MouseLocked prevents multiple events to be detected at once : once the mouse is locked, 
// no other action will be triggered after the first one, while the same keys are pressed
boolean mouseLocked = false;

int elementInFocusID = -1;

boolean noElementInFocus = true;
boolean elementInFocusIsPlayerTeam1 = false;
boolean elementInFocusIsPlayerTeam2 = false;
boolean ballInFocus = false;

// Moving elements
int lineInFocusID = -1;
int circleInFocusID = -1;
int rectInFocusID = -1;
int textInFocusID = -1;
int memoryX1 = -1;
int memoryY1 = -1;
int memoryX2 = -1;
int memoryY2 = -1;
int memoryMouseX = -1;
int memoryMouseY = -1;

boolean baseLineLocked = false;
int baseLineX;
int baseLineY;
Line line;

boolean baseCircleLocked = false;
int baseCircleX;
int baseCircleY;
Circle circle;

boolean baseRectLocked = false;
int baseRectX;
int baseRectY;
Rect rect;

boolean spotTaken = false;
int teamInWhichPlayerIsBeingAdded;
boolean edition = false;
int playerToSetNameID;

int textToEditID;

boolean hook = false;
Player hookLineBase1, hookLineBase2;

boolean blockCircleDeletion = false;
boolean blockRectDeletion = false;

int toggledButtonID = 0;
boolean lockHisto = false;
boolean lockUndo = false;
boolean lockRedo = false;


void runEventManager() 
{
    if(!INPUTMODE) 
    {

        /*
        BUTTON TOGGLING
        */
        if(mousePressed && !mouseLocked && ui.overUI(mouseX, mouseY)) {
            int i = 0;
            boolean found = false;
            while(i < ui.size && !found) {
                if (i != 1 && i != 2 && i!= 13 && i != 14) {
                    if (ui.getButtons().get(i).overButton(mouseX,mouseY) && toggledButtonID != i) {
                        ui.getButtons().get(i).toggle(); // Toggle button ON
                        ui.getButtons().get(toggledButtonID).toggle(); // Toggle previous button OFF
                        toggledButtonID = i;
                        found = true;
                    }
                }
                i++;
            }
        }

        /*
        MOVE
        */
        else if(mousePressed && !mouseLocked && ui.getButtons().get(0).isToggled()) {

            // Did we click on the ball ?
            if(noElementInFocus || ballInFocus) { // No Element focused or ball already
                if(ballInFocus) { // If the ball is already in focus
                    if (!lockHisto) {
                        Action a = new Action((int)ball.getX(), (int)ball.getY(), "Ball", ball);
                        histo.add(a);
                        lockHisto = true;
                    }
                    ball.setX(mouseX);
                    ball.setY(mouseY);
                }
                if(ball.overBall(mouseX, mouseY)) {
                    if (!lockHisto) {
                        Action a = new Action((int)ball.getX(), (int)ball.getY(), "Ball", ball);
                        histo.add(a);
                        lockHisto = true;
                    }
                    ball.setX(mouseX);
                    ball.setY(mouseY);
                    noElementInFocus = false;
                    ballInFocus = true;
                }
            }

            // Did we click on a player ?
            if(noElementInFocus || elementInFocusIsPlayerTeam1) { // Pas d'élément focus ou team1
                if(elementInFocusIsPlayerTeam1) { // si team 1
                    Player p = team1.get(elementInFocusID);
                    if (!lockHisto) {
                        Action a = new Action(p.getX(), p.getY(), "Player", p);
                        histo.add(a);
                        lockHisto = true;
                    }
                    p.setX(mouseX);
                    p.setY(mouseY);
                } else { // si rien de focus
                    for(int i = 0; i < team1.size(); i++) {
                        Player p = team1.get(i);
                        if(p.overPlayer(mouseX, mouseY)) {
                            if (!lockHisto) {
                                Action a = new Action(p.getX(), p.getY(), "Player", p);
                                histo.add(a);
                                lockHisto = true;
                            }
                            p.setX(mouseX);
                            p.setY(mouseY);
                            noElementInFocus = false;
                            elementInFocusIsPlayerTeam1 = true;
                            elementInFocusID = i;
                        }
                    }
                }
            } 
            if(noElementInFocus || elementInFocusIsPlayerTeam2) { // Pas d'élément focus ou team2
                if(elementInFocusIsPlayerTeam2) { // si team 2
                    Player p = team2.get(elementInFocusID);
                    if (!lockHisto) {
                        Action a = new Action(p.getX(), p.getY(), "Player", p);
                        histo.add(a);
                        lockHisto = true;
                    }
                    p.setX(mouseX);
                    p.setY(mouseY);
                } else {
                    for(int i = 0; i < team2.size(); i++) {
                        Player p = team2.get(i);
                        if(p.overPlayer(mouseX, mouseY)) {
                            if (!lockHisto) {
                                Action a = new Action(p.getX(), p.getY(), "Player", p);
                                histo.add(a);
                                lockHisto = true;
                            }
                            p.setX(mouseX);
                            p.setY(mouseY);
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
                    Line line = lines.get(lineInFocusID);
                    if (!lockHisto) {
                        Action a = new Action(line.getX1(), line.getY1(), line.getX2(), line.getY2(), "Line", line);
                        histo.add(a);
                        lockHisto = true;
                    }
                    line.setX1(line.getX1() + (mouseX - memoryMouseX));
                    line.setY1(line.getY1() + (mouseY - memoryMouseY));
                    line.setX2(line.getX2() + (mouseX - memoryMouseX));
                    line.setY2(line.getY2() + (mouseY - memoryMouseY));
                    memoryMouseX = mouseX;
                    memoryMouseY = mouseY;
                    noElementInFocus = false;
                } else {
                    for(int i = 0; i < lines.size(); i++) {
                        Line line = lines.get(i);
                        if (line.overLine(mouseX, mouseY) && !(line instanceof HookLine)) {
                            if (!lockHisto) {
                                Action a = new Action(line.getX1(), line.getY1(), line.getX2(), line.getY2(), "Line", line);
                                histo.add(a);
                                lockHisto = true;
                            }
                            lineInFocusID = i;
                            memoryMouseX = mouseX;
                            memoryMouseY = mouseY;
                            noElementInFocus = false;
                        }
                    }
                }
            }

            // Did we click on a text ?
            if(noElementInFocus || textInFocusID != -1) { // Pas d'élément focus ou text
                if(textInFocusID != -1) { // If the text is already in focus
                    if (!lockHisto) {
                        Action a = new Action(texts.get(textInFocusID).getX(), texts.get(textInFocusID).getY(), "Text", texts.get(textInFocusID));
                        histo.add(a);
                        lockHisto = true;
                    }
                    texts.get(textInFocusID).setX(texts.get(textInFocusID).getX() + (mouseX - memoryMouseX));
                    texts.get(textInFocusID).setY(texts.get(textInFocusID).getY() + (mouseY - memoryMouseY));
                    memoryMouseX = mouseX;
                    memoryMouseY = mouseY;
                    noElementInFocus = false;
                } else {
                    for(int i = 0; i < texts.size(); i++) {
                        if (texts.get(i).overText(mouseX, mouseY)) {
                            if (!lockHisto) {
                                Action a = new Action(texts.get(i).getX(), texts.get(i).getY(), "Text", texts.get(i));
                                histo.add(a);
                                lockHisto = true;
                            }
                            textInFocusID = i;
                            memoryMouseX = mouseX;
                            memoryMouseY = mouseY;
                            noElementInFocus = false;
                        }
                    }
                }
            }

            // Did we click on a rect ?
            if(noElementInFocus || rectInFocusID != -1) { // Pas d'élément focus ou rect
                if(rectInFocusID != -1) { // If the rect is already in focus
                    if (!lockHisto) {
                        Action a = new Action((int)rects.get(rectInFocusID).getX1(), (int)rects.get(rectInFocusID).getY1(),
                                            (int)rects.get(rectInFocusID).getX2(), (int)rects.get(rectInFocusID).getY2(), "Rect", rects.get(rectInFocusID));
                        histo.add(a);
                        lockHisto = true;
                    }
                    rects.get(rectInFocusID).setX1(rects.get(rectInFocusID).getX1() + (mouseX - memoryMouseX));
                    rects.get(rectInFocusID).setY1(rects.get(rectInFocusID).getY1() + (mouseY - memoryMouseY));
                    rects.get(rectInFocusID).setX2(rects.get(rectInFocusID).getX2() + (mouseX - memoryMouseX));
                    rects.get(rectInFocusID).setY2(rects.get(rectInFocusID).getY2() + (mouseY - memoryMouseY));
                    memoryMouseX = mouseX;
                    memoryMouseY = mouseY;
                    noElementInFocus = false;
                } else {
                    for(int i = 0; i < rects.size(); i++) {
                        if (rects.get(i).overRect(mouseX, mouseY)) {
                            if (!lockHisto) {
                                Action a = new Action((int)rects.get(i).getX1(), (int)rects.get(i).getY1(),
                                                    (int)rects.get(i).getX2(), (int)rects.get(i).getY2(), "Rect", rects.get(i));
                                histo.add(a);
                                lockHisto = true;
                            }
                            rectInFocusID = i;
                            memoryMouseX = mouseX;
                            memoryMouseY = mouseY;
                            noElementInFocus = false;
                        }
                    }
                }
            }

            // Did we click on a circle ?
            if(noElementInFocus || circleInFocusID != -1) { // No focused element or circle
                if(circleInFocusID != -1) { // If the circle is already in focus
                    if (!lockHisto) {
                        Action a = new Action((int)circles.get(circleInFocusID).getX1(), (int)circles.get(circleInFocusID).getY1(),
                                            (int)circles.get(circleInFocusID).getX2(), (int)circles.get(circleInFocusID).getY2(), "Circle", circles.get(circleInFocusID));
                        histo.add(a);
                        lockHisto = true;
                    }
                    circles.get(circleInFocusID).setX1(circles.get(circleInFocusID).getX1() + (mouseX - memoryMouseX));
                    circles.get(circleInFocusID).setY1(circles.get(circleInFocusID).getY1() + (mouseY - memoryMouseY));
                    circles.get(circleInFocusID).setX2(circles.get(circleInFocusID).getX2() + (mouseX - memoryMouseX));
                    circles.get(circleInFocusID).setY2(circles.get(circleInFocusID).getY2() + (mouseY - memoryMouseY));
                    memoryMouseX = mouseX;
                    memoryMouseY = mouseY;
                    noElementInFocus = false;
                } else {
                    for(int i = 0; i < circles.size(); i++) {
                        if (circles.get(i).overCircle(mouseX, mouseY)) {
                            if (!lockHisto) {
                                Action a = new Action((int)circles.get(i).getX1(), (int)circles.get(i).getY1(),
                                                    (int)circles.get(i).getX2(), (int)circles.get(i).getY2(), "Circle", circles.get(i));
                                histo.add(a);
                                lockHisto = true;
                            }
                            circleInFocusID = i;
                            memoryMouseX = mouseX;
                            memoryMouseY = mouseY;
                            noElementInFocus = false;
                        }
                    }
                }
            }
            
        }


        /*
        UNDO
        */
        if(mousePressed && !lockUndo && ui.overUI(mouseX, mouseY)) {
            if (ui.getButtons().get(1).overButton(mouseX,mouseY)) {
                histo.undo();
                lockUndo = true;
            }
        }


        /*
        REDO
        */
        if(mousePressed && !lockRedo && ui.overUI(mouseX, mouseY)) {
            if (ui.getButtons().get(2).overButton(mouseX,mouseY)) {
                histo.redo();
                lockRedo = true;
            }
        }


        /*
        FREE TEXT
        */
        else if(mousePressed && ui.getButtons().get(3).isToggled()) {
            if(!ui.overUI(mouseX, mouseY)) {
                texts.add(new Text(mouseX, mouseY, ""));
                if (!lockHisto) {
                    Action a = new Action(texts.get(texts.size()-1));
                    histo.add(a);
                    lockHisto = true;
                }
                textToEditID = texts.size() - 1;
                // mouseLocked = true;
                saved = "";
                INPUTTEXT = true;
                INPUTMODE = true;
            } 
        }


        /*
        LINE
        */
        else if(mousePressed && ui.getButtons().get(4).isToggled() && !ui.overUI(mouseX, mouseY)) {

            int i = 0;
            int j = 0;

            // If we're over a player, in which case we prepare a HookLine
            while(i < team1.size() && !hook && !baseLineLocked) {
                if(team1.get(i).overPlayer(mouseX, mouseY)) {
                    hook = true;
                    hookLineBase1 = team1.get(i);
                }
                i++;
            }
            while(j < team2.size() && !hook && !baseLineLocked) {
                if(team2.get(j).overPlayer(mouseX, mouseY)) {
                    hook = true;
                    hookLineBase1 = team2.get(i);
                }
                j++;
            }

            if(!baseLineLocked) {
                baseLineX = mouseX;
                baseLineY = mouseY;
            }
            baseLineLocked = true;
            Line line = new Line(baseLineX, baseLineY, mouseX, mouseY);
            line.drawLine();

            mouseLocked = true;
        }


        /*
        DASHLINE
        */
        else if (mousePressed && ui.getButtons().get(5).isToggled() && !ui.overUI(mouseX, mouseY)) {
            if(!baseLineLocked) {
                baseLineX = mouseX;
                baseLineY = mouseY;
            }

            baseLineLocked = true;
            DashLine dashLine = new DashLine(baseLineX, baseLineY, mouseX, mouseY);
            dashLine.drawLine();

            mouseLocked = true;
        }


        /*
        ARROW
        */
        else if (mousePressed && ui.getButtons().get(6).isToggled() && !ui.overUI(mouseX, mouseY)) {
            if(!baseLineLocked) {
                baseLineX = mouseX;
                baseLineY = mouseY;
            }

            baseLineLocked = true;
            Arrow arrow = new Arrow(baseLineX, baseLineY, mouseX, mouseY);
            arrow.drawLine();

            mouseLocked = true;
        }      


        /*
        CIRCLE
        */
        else if (mousePressed && ui.getButtons().get(7).isToggled() && !ui.overUI(mouseX, mouseY)) {
            if(!baseCircleLocked) {
                baseCircleX = mouseX;
                baseCircleY = mouseY;
            }

            baseCircleLocked = true;
            Circle circle = new Circle(baseCircleX, baseCircleY, mouseX, mouseY);
            circle.drawCircle();

            mouseLocked = true;
        }


        /*
        RECT
        */
        else if (mousePressed && ui.getButtons().get(8).isToggled() && !ui.overUI(mouseX, mouseY)) {
            if(!baseRectLocked) {
                baseRectX = mouseX;
                baseRectY = mouseY;
            }

            baseRectLocked = true;
            Rect rect = new Rect(baseRectX, baseRectY, mouseX, mouseY);
            rect.drawRect();

            mouseLocked = true;
        }


        /*
        ERASE
        */
        if(mousePressed && ui.getButtons().get(9).isToggled() && !ui.overUI(mouseX, mouseY)) {

            // Did we click on a player ?
            for(int i = 0; i < team1.size(); i++) { // Team 1
                if(team1.get(i).overPlayer(mouseX, mouseY)) {
                    if (!lockHisto) {
                        Action a = new Action(team1.get(i), 5);
                        histo.add(a);
                    }
                    team1FreeJerseyNumbers.add(team1.get(i).getNumber());
                    team1.remove(i);
                    blockRectDeletion = true;
                    blockCircleDeletion = true;
                    break;
                }
            }

            for(int i = 0; i < team2.size(); i++) { // Team 2
                if(team2.get(i).overPlayer(mouseX, mouseY)) {
                    if (!lockHisto) {
                        Action a = new Action(team2.get(i), 5);
                        histo.add(a);
                    }
                    team2FreeJerseyNumbers.add(team2.get(i).getNumber());
                    team2.remove(i);
                    blockRectDeletion = true;
                    blockCircleDeletion = true;
                    break;
                }
            }

            // Did we click on an line ?
            for(int i = 0; i < lines.size(); i++) {
                if(lines.get(i).overLine(mouseX, mouseY)) {
                    if (!lockHisto) {
                        Action a = new Action(lines.get(i), 5);
                        histo.add(a);
                    }
                    lines.remove(i);
                    blockRectDeletion = true;
                    blockCircleDeletion = true;
                    break;
                }
            }

            // Did we click on an text ?
            for(int i = 0; i < texts.size(); i++) {
                if(texts.get(i).overText(mouseX, mouseY)) {
                    if (!lockHisto) {
                        Action a = new Action(texts.get(i), 5);
                        histo.add(a);
                    }
                    texts.remove(i);
                    blockRectDeletion = true;
                    blockCircleDeletion = true;
                    break;
                }
            }

            // Did we click on an circle ?
            if(!blockCircleDeletion) {
                for(int i = 0; i < circles.size(); i++) {
                    if(circles.get(i).overCircle(mouseX, mouseY)) {
                        if (!lockHisto) {
                            Action a = new Action(circles.get(i), 5);
                            histo.add(a);
                        }
                        circles.remove(i);
                        break;
                    }
                }
            }

            // Did we click on an rect ?
            if(!blockRectDeletion) {
                for(int i = 0; i < rects.size(); i++) {
                    if(rects.get(i).overRect(mouseX, mouseY)) {
                        if (!lockHisto) {
                            Action a = new Action(rects.get(i), 5);
                            histo.add(a);
                        }
                        rects.remove(i);
                        break;
                    }
                }
            }
        }


        /*
        PLAYER CREATION
        */
        if (mousePressed && ui.getButtons().get(10).isToggled() && !ui.overUI(mouseX, mouseY)) { // Creating player in team 1

            for(int i = 0; i < team1.size(); i++) {
                if(team1.get(i).overPlayer(mouseX, mouseY)) { // If a player is already present on this coordinates
                    spotTaken = true;
                }
            }

            if(!spotTaken) {
                computeNextJerseyNumber(1);
                team1.add(new Player("Joueur " + team1NextJerseyNumber, 1, team1NextJerseyNumber, mouseX, mouseY));
                if (!lockHisto) {
                    Action a = new Action(team1.get(team1.size() - 1));
                    histo.add(a);
                    lockHisto = true;
                }
                team1JerseyNumbers.add(team1NextJerseyNumber);
                mouseLocked = true;
                teamInWhichPlayerIsBeingAdded = 1;
                saved = "Joueur " + team1NextJerseyNumber;
                playerToSetNameID = team1.size() - 1;
                INPUTPLAYER = true;
                INPUTMODE = true;
            }

        } else if (mousePressed && ui.getButtons().get(11).isToggled() && !ui.overUI(mouseX, mouseY)) { // Creating player in team 2

            for(int i = 0; i < team2.size(); i++) {
                if(team2.get(i).overPlayer(mouseX, mouseY)) { // If a player is already present on this coordinates
                    spotTaken = true;
                }
            }

            if(!spotTaken) {
                computeNextJerseyNumber(2);
                team2.add(new Player("Joueur " + team2NextJerseyNumber, 2, team2NextJerseyNumber, mouseX, mouseY));
                if (!lockHisto) {
                    Action a = new Action(team2.get(team2.size() - 1));
                    histo.add(a);
                    lockHisto = true;
                }
                team2JerseyNumbers.add(team2NextJerseyNumber);
                mouseLocked = true;
                teamInWhichPlayerIsBeingAdded = 2;
                saved = "Joueur " + team2NextJerseyNumber;
                playerToSetNameID = team2.size() - 1;
                INPUTPLAYER = true;
                INPUTMODE = true;
            }
        }


        /*
        RENAME
        */
        else if (mousePressed && ui.getButtons().get(12).isToggled() && !ui.overUI(mouseX, mouseY)) {
            if(mousePressed) {
                // Did we click on team 1 ?
                for(int i = 0; i < team1.size(); i++) { // Renomme équipe 1
                    if(team1.get(i).overPlayer(mouseX, mouseY)) {
                        if (!lockHisto) {
                            Action a = new Action(team1.get(i).getName(), team1.get(i));
                            histo.add(a);
                            lockHisto = true;
                        }
                        mouseLocked = true;
                        teamInWhichPlayerIsBeingAdded = 1;
                        saved = "Joueur " + team1.get(i).getNumber();
                        edition = true;
                        playerToSetNameID = i;
                        INPUTPLAYER = true;
                        INPUTMODE = true;
                        break;
                    }
                }

                // Did we click on team 2 ?
                for(int i = 0; i < team2.size(); i++) { // Renomme équipe 2
                    if(team2.get(i).overPlayer(mouseX, mouseY)) {
                        if (!lockHisto) {
                            Action a = new Action(team2.get(i).getName(), team2.get(i));
                            histo.add(a);
                            lockHisto = true;
                        }
                        mouseLocked = true;
                        teamInWhichPlayerIsBeingAdded = 2;
                        saved = "Joueur " + team2.get(i).getNumber();
                        edition = true;
                        playerToSetNameID = i;
                        INPUTPLAYER = true;
                        INPUTMODE = true;
                        break;
                    }
                }
            }
        } 

        /*
        RESET
        */
        if(mousePressed && !mouseLocked && ui.get(13).overButton(mouseX, mouseY)) {
            reset();
        }

        /*
        EXIT
        */
        if(mousePressed && !mouseLocked && ui.get(14).overButton(mouseX, mouseY)) {
            exit();
        } 

    }
        

}

void mouseReleased() {

    if(!INPUTMODE) 
    {

        /*
        SAVE LINE
        */
        if (ui.getButtons().get(4).isToggled() && !ui.overUI(mouseX, mouseY)) {

            if(hook) {

                for(int i = 0; i < team1.size(); i++) {
                    if(team1.get(i).overPlayer(mouseX, mouseY)) {
                        hookLineBase2 = team1.get(i);
                    } 
                }
                for(int i = 0; i < team2.size(); i++) {
                    if(team2.get(i).overPlayer(mouseX, mouseY)) {
                        hookLineBase2 = team2.get(i);
                    }
                }

                lines.add(new HookLine(hookLineBase1, hookLineBase2));
                if (!lockHisto) {
                    Action a = new Action("Hook", hookLineBase1, hookLineBase2, lines.get(lines.size()-1));
                    histo.add(a);
                    lockHisto = true;
                }

                mouseLocked = true;

            } else {
                if(Math.abs(baseLineX-mouseX) > 20 || Math.abs(baseLineY-mouseY) > 20) {
                    lines.add(new Line(baseLineX, baseLineY, mouseX, mouseY));
                    if (!lockHisto) {
                        Action a = new Action("Line", lines.get(lines.size()-1));
                        histo.add(a);
                        lockHisto = true;
                    }

                    mouseLocked = true;
                }
            }


            
        }


        /*
        SAVE DASHLINE
        */
        else if (ui.getButtons().get(5).isToggled() && !ui.overUI(mouseX, mouseY)) {
            if(Math.abs(baseLineX-mouseX) > 20 || Math.abs(baseLineY-mouseY) > 20) {
                DashLine tmp = new DashLine(baseLineX, baseLineY, mouseX, mouseY);
                lines.add(tmp);
                if (!lockHisto) {
                    Action a = new Action("Dash", tmp);
                    histo.add(a);
                    lockHisto = true;
                }

                mouseLocked = true;
            }
        }


        /*
        SAVE ARROW
        */
        else if (ui.getButtons().get(6).isToggled() && !ui.overUI(mouseX, mouseY)) {
            if(Math.abs(baseLineX-mouseX) > 20 || Math.abs(baseLineY-mouseY) > 20) {
                Arrow tmp = new Arrow(baseLineX, baseLineY, mouseX, mouseY);
                lines.add(tmp);
                if (!lockHisto) {
                    Action a = new Action("Arrow", tmp);
                    histo.add(a);
                    lockHisto = true;
                }

                mouseLocked = true;
            }
        }


        /*
        SAVE CIRCLE
        */
        else if (ui.getButtons().get(7).isToggled() && !ui.overUI(mouseX, mouseY)) {

            if(Math.abs(baseCircleX-mouseX) > 100 && Math.abs(baseCircleY - mouseY) > 100) {
                circles.add(new Circle(baseCircleX, baseCircleY, mouseX, mouseY));
                if (!lockHisto) {
                    Action a = new Action("Circle", circles.get(circles.size()-1));
                    histo.add(a);
                    lockHisto = true;
                }
            }

            mouseLocked = true;
        }


        /*
        SAVE RECT
        */
        else if (ui.getButtons().get(8).isToggled() && !ui.overUI(mouseX, mouseY)) {

            if(Math.abs(baseRectX-mouseX) > 100 && Math.abs(baseRectY - mouseY) > 100) {
                Rect tmp = new Rect(baseRectX, baseRectY, mouseX, mouseY);
                rects.add(tmp);
                if (!lockHisto) {
                    Action a = new Action("Rect", tmp);
                    histo.add(a);
                    lockHisto = true;
                }
            }
            

            mouseLocked = true;
        }


        /* 
        CIRCLES CENTERS
        */
        for(int i = 0; i < circles.size(); i++) {
            circles.get(i).findCenter();
        }

        /*
        CONTROL RESET
        */
        mouseLocked = false;
        noElementInFocus = true;
        elementInFocusIsPlayerTeam1 = false;
        elementInFocusIsPlayerTeam2 = false;
        ballInFocus = false;

        baseLineLocked = false;
        baseCircleLocked = false;
        baseRectLocked = false;
        
        blockRectDeletion = false;
        blockCircleDeletion = false;

        hook = false;

        // Unlocks Histo
        lockHisto = false;
        lockUndo = false;
        lockRedo = false;

        /*
        IDs and numbers reset
        */
        elementInFocusID = -1;
        lineInFocusID = -1;
        circleInFocusID = -1;
        rectInFocusID = -1;
        textInFocusID = -1;
        memoryX1 = -1;
        memoryY1 = -1;
        memoryX2 = -1;
        memoryY2 = -1;
        memoryMouseX = -1;
        memoryMouseX = -1;

    }

	
}


void keyReleased() {
    if(!INPUTMODE) {

        if(key == ' ') {
            CP.computeNextColor();
        } 

    }

    if (keyCode == CONTROL) {
        controlDown = false;
    } if (keyCode == SHIFT) {
        shiftDown = false;
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
}

