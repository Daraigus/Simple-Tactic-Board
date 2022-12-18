class Histo {

    private ArrayList<Action> past;
    private ArrayList<Action> future;

    Histo() {
        this.past = new ArrayList<Action>();
        this.future = new ArrayList<Action>();
    }

    public void add(Action a) {
        // a.print();
        this.pastLog(a);
        this.future.clear();
    }

    public void clear() {
        this.past.clear();
        this.future.clear();
    }

    private void pastLog(Action a) {
        // System.out.print("ADDPAST \n");
        this.past.add(a);
    }

    private void futureLog(Action a) {
        // System.out.print("ADDFUTUR \n");
        this.future.add(a);
    }

    public void undo() {

        if(this.past.size() != 0) {
            // System.out.print("UNDO : ");

            Action action = this.past.get(this.past.size()-1);
            action.print();

            switch (action.getAction()){
                
                case "Move": // Revert to old position
                    if(action.getType() == "Player") {
                        Player p = action.getPlayer();
                        Action a = new Action(p.getX(), p.getY(), "Player", p);
                        this.futureLog(a);
                        p.setX(action.getX());
                        p.setY(action.getY());
                    } else if(action.getType() == "Ball") {
                        Ball b = action.getBall();
                        Action a = new Action((int)b.getX(), (int)b.getY(), "Ball", b);
                        this.futureLog(a);
                        b.setX(action.getX());
                        b.setY(action.getY());
                    } else if(action.getType() == "Text") {
                        Text t = action.getText();
                        Action a = new Action(t.getX(), t.getY(), "Text", t);
                        this.futureLog(a);
                        t.setX(action.getX());
                        t.setY(action.getY());
                    }
                    break;

                case "Move2": // Revert to old position but has 2 set of coordinates

                    if(action.getType() == "Line") {
                        Line tmp = action.getLine();
                        Action a = new Action(tmp.getX1(), tmp.getY1(), tmp.getX2(), tmp.getY2(), "Line", tmp);
                        this.futureLog(a);
                        tmp.setX1(action.getX());
                        tmp.setY1(action.getY());
                        tmp.setX2(action.getX2());
                        tmp.setY2(action.getY2());
                    } else if(action.getType() == "Dash") {
                        DashLine tmp = action.getDashLine();
                        Action a = new Action(tmp.getX1(), tmp.getY1(), tmp.getX2(), tmp.getY2(), "Dash", tmp);
                        this.futureLog(a);
                        tmp.setX1(action.getX());
                        tmp.setY1(action.getY());
                        tmp.setX2(action.getX2());
                        tmp.setY2(action.getY2());
                    } else if(action.getType() == "Arrow") {
                        Arrow tmp = action.getArrow();
                        Action a = new Action(tmp.getX1(), tmp.getY1(), tmp.getX2(), tmp.getY2(), "Arrow", tmp);
                        this.futureLog(a);
                        tmp.setX1(action.getX());
                        tmp.setY1(action.getY());
                        tmp.setX2(action.getX2());
                        tmp.setY2(action.getY2());
                    } else if(action.getType() == "Rect") {
                        Rect tmp = action.getRect();
                        Action a = new Action((int)tmp.getX1(), (int)tmp.getY1(), (int)tmp.getX2(), (int)tmp.getY2(), "Rect", tmp);
                        this.futureLog(a);
                        tmp.setX1(action.getX());
                        tmp.setY1(action.getY());
                        tmp.setX2(action.getX2());
                        tmp.setY2(action.getY2());
                    } else {
                        Circle tmp = action.getCircle();
                        Action a = new Action((int)tmp.getX1(), (int)tmp.getY1(), (int)tmp.getX2(), (int)tmp.getY2(), "Circle", tmp);
                        this.futureLog(a);
                        tmp.setX1(action.getX());
                        tmp.setY1(action.getY());
                        tmp.setX2(action.getX2());
                        tmp.setY2(action.getY2());
                    }
                    break;

                case "Draw": // Delete
                    if(action.getType() == "Line") {
                        Line tmp = action.getLine();
                        Action a = new Action("Line", tmp);
                        this.futureLog(a);
                        lines.remove(tmp);
                    } else if(action.getType() == "Dash") {
                        DashLine tmp = action.getDashLine();
                        Action a = new Action("Dash", tmp);
                        this.futureLog(a);
                        lines.remove(tmp);
                    } else if(action.getType() == "Arrow") {
                        Arrow tmp = action.getArrow();
                        Action a = new Action("Arrow", tmp);
                        this.futureLog(a);
                        lines.remove(tmp);
                    } else if(action.getType() == "Rect") {
                        Rect tmp = action.getRect();
                        Action a = new Action("Rect", tmp);
                        this.futureLog(a);
                        rects.remove(tmp);
                    } else {
                        Circle tmp = action.getCircle();
                        Action a = new Action("Circle", tmp);
                        this.futureLog(a);
                        circles.remove(tmp);
                    }
                    break;

                case "Hook": // Delete
                    HookLine tmp = action.getHookLine();
                    Action a = new Action("Hook", action.getPlayer(), action.getPlayer2(), tmp);
                    this.futureLog(a);
                    lines.remove(tmp);
                    break;

                case "Text": // Delete
                    Text tmp2 = action.getText();
                    Action a2 = new Action(tmp2);
                    this.futureLog(a2);
                    texts.remove(tmp2);
                    break;

                case "Erase": // Create
                    if(action.getType() == "Line") {
                        Line tmp5 = action.getLine();
                        Action a5 = new Action(tmp5, 5);
                        this.futureLog(a5);
                        lines.add(tmp5);
                    } else if(action.getType() == "Dash") {
                        DashLine tmp5 = action.getDashLine();
                        Action a5 = new Action(tmp5, 5);
                        this.futureLog(a5);
                        lines.add(tmp5);
                    } else if(action.getType() == "Arrow") {
                        Arrow tmp5 = action.getArrow();
                        Action a5 = new Action(tmp5, 5);
                        this.futureLog(a5);
                        lines.add(tmp5);
                    } else if(action.getType() == "Rect") {
                        Rect tmp5 = action.getRect();
                        Action a5 = new Action(tmp5, 5);
                        this.futureLog(a5);
                        rects.add(tmp5);
                    } else if(action.getType() == "Player") {
                        Player tmp5 = action.getPlayer();
                        Action a5 = new Action(tmp5, 5);
                        this.futureLog(a5);
                        if (tmp5.getTeam() == 1) {
                            computeNextJerseyNumber(1);
                            team1.add(tmp5);
                        } 
                        else {
                            computeNextJerseyNumber(2);
                            team2.add(tmp5);
                        }
                    } else if(action.getType() == "Text") {
                        Text tmp5 = action.getText();
                        Action a5 = new Action(tmp5, 5);
                        this.futureLog(a5);
                        texts.add(tmp5);
                    } else {
                        Circle tmp5 = action.getCircle();
                        Action a5 = new Action(tmp5, 5);
                        this.futureLog(a5);
                        circles.add(tmp5);
                    }
                    break;

                case "Player": // Delete from team
                    Player tmp3 = action.getPlayer();
                    Action a3 = new Action(tmp3);
                    this.futureLog(a3);
                    if(tmp3.getTeam() == 1) { 
                        team1FreeJerseyNumbers.add(tmp3.getNumber());
                        team1.remove(tmp3);
                    } else { 
                        team2FreeJerseyNumbers.add(tmp3.getNumber());
                        team2.remove(tmp3);
                    }
                    break;

                case "Rename": // Revert name
                    Player tmp4 = action.getPlayer();
                    Action a4 = new Action(tmp4.getName(), tmp4);
                    this.futureLog(a4);
                    tmp4.setName(action.getContent());
                    break;
            }


            // Remove the action from the past list
            this.past.remove(action);
        }

    }

    public void redo() {

        if(this.future.size() != 0) {
            // System.out.print("REDO : ");

            Action action = this.future.get(this.future.size()-1);
            action.print();

            switch (action.getAction()) {

                case "Move": // Revert to new position
                    if(action.getType() == "Player") {
                        Player p = action.getPlayer();
                        Action a = new Action(p.getX(), p.getY(), "Player", p);
                        this.pastLog(a);
                        p.setX(action.getX());
                        p.setY(action.getY());
                    } else if(action.getType() == "Ball") {
                        Ball b = action.getBall();
                        Action a = new Action((int)b.getX(), (int)b.getY(), "Ball", b);
                        this.pastLog(a);
                        b.setX(action.getX());
                        b.setY(action.getY());
                    } else {
                        Text t = action.getText();
                        Action a = new Action(t.getX(), t.getY(), "Text", t);
                        this.pastLog(a);
                        t.setX(action.getX());
                        t.setY(action.getY());
                    }
                    break;

                case "Move2": // Revert to new position but has 2 set of coordinates

                    if(action.getType() == "Line") {
                        Line tmp = action.getLine();
                        Action a = new Action(tmp.getX1(), tmp.getY1(), tmp.getX2(), tmp.getY2(), "Line", tmp);
                        this.pastLog(a);
                        tmp.setX1(action.getX());
                        tmp.setY1(action.getY());
                        tmp.setX2(action.getX2());
                        tmp.setY2(action.getY2());
                    } else if(action.getType() == "Dash") {
                        DashLine tmp = action.getDashLine();
                        Action a = new Action(tmp.getX1(), tmp.getY1(), tmp.getX2(), tmp.getY2(), "Dash", tmp);
                        this.pastLog(a);
                        tmp.setX1(action.getX());
                        tmp.setY1(action.getY());
                        tmp.setX2(action.getX2());
                        tmp.setY2(action.getY2());
                    } else if(action.getType() == "Arrow") {
                        Arrow tmp = action.getArrow();
                        Action a = new Action(tmp.getX1(), tmp.getY1(), tmp.getX2(), tmp.getY2(), "Arrow", tmp);
                        this.pastLog(a);
                        tmp.setX1(action.getX());
                        tmp.setY1(action.getY());
                        tmp.setX2(action.getX2());
                        tmp.setY2(action.getY2());
                    } else if(action.getType() == "Rect") {
                        Rect tmp = action.getRect();
                        Action a = new Action((int)tmp.getX1(), (int)tmp.getY1(), (int)tmp.getX2(), (int)tmp.getY2(), "Rect", tmp);
                        this.pastLog(a);
                        tmp.setX1(action.getX());
                        tmp.setY1(action.getY());
                        tmp.setX2(action.getX2());
                        tmp.setY2(action.getY2());
                    } else if (action.getType() == "Circle") {
                        Circle tmp = action.getCircle();
                        Action a = new Action((int)tmp.getX1(), (int)tmp.getY1(), (int)tmp.getX2(), (int)tmp.getY2(), "Circle", tmp);
                        this.pastLog(a);
                        tmp.setX1(action.getX());
                        tmp.setY1(action.getY());
                        tmp.setX2(action.getX2());
                        tmp.setY2(action.getY2());
                    } 
                    break;

                case "Draw": // Create again
                    if(action.getType() == "Line") {
                        Line tmp = action.getLine();
                        Action a = new Action("Line", tmp);
                        this.pastLog(a);
                        lines.add(tmp);
                    } else if(action.getType() == "Dash") {
                        DashLine tmp = action.getDashLine();
                        Action a = new Action("Dash", tmp);
                        this.pastLog(a);
                        lines.add(tmp);
                    } else if(action.getType() == "Arrow") {
                        Arrow tmp = action.getArrow();
                        Action a = new Action("Arrow", tmp);
                        this.pastLog(a);
                        lines.add(tmp);
                    } else if(action.getType() == "Rect") {
                        Rect tmp = action.getRect();
                        Action a = new Action("Rect", tmp);
                        this.pastLog(a);
                        rects.add(tmp);
                    } else {
                        Circle tmp = action.getCircle();
                        Action a = new Action("Circle", tmp);
                        this.pastLog(a);
                        circles.add(tmp);
                    }
                    break;

                case "Hook": // Create again
                    HookLine tmp = action.getHookLine();
                    Action a = new Action("Hook", action.getPlayer(), action.getPlayer2(), tmp);
                    this.pastLog(a);
                    lines.add(tmp);
                    break;

                case "Text": // Create again
                    Text tmp2 = action.getText();
                    Action a2 = new Action(tmp2);
                    this.pastLog(a2);
                    texts.add(tmp2);
                    break;

                case "Erase": // Erase
                    if(action.getType() == "Line") {
                        Line tmp5 = action.getLine();
                        Action a5 = new Action(tmp5, 5);
                        this.pastLog(a5);
                        lines.remove(tmp5);
                    } else if(action.getType() == "Dash") {
                        DashLine tmp5 = action.getDashLine();
                        Action a5 = new Action(tmp5, 5);
                        this.pastLog(a5);
                        lines.remove(tmp5);
                    } else if(action.getType() == "Arrow") {
                        Arrow tmp5 = action.getArrow();
                        Action a5 = new Action(tmp5, 5);
                        this.pastLog(a5);
                        lines.remove(tmp5);
                    } else if(action.getType() == "Rect") {
                        Rect tmp5 = action.getRect();
                        Action a5 = new Action(tmp5, 5);
                        this.pastLog(a5);
                        rects.remove(tmp5);
                    } else if(action.getType() == "Player") {
                        Player tmp5 = action.getPlayer();
                        Action a5 = new Action(tmp5, 5);
                        this.pastLog(a5);
                        if (tmp5.getTeam() == 1) team1.remove(tmp5);
                        else team2.remove(tmp5);
                    } else if(action.getType() == "Text") {
                        Text tmp5 = action.getText();
                        Action a5 = new Action(tmp5, 5);
                        this.pastLog(a5);
                        texts.remove(tmp5);
                    } else {
                        Circle tmp5 = action.getCircle();
                        Action a5 = new Action(tmp5, 5);
                        this.pastLog(a5);
                        circles.remove(tmp5);
                    }
                    break;

                case "Player": // Create again
                    Player tmp3 = action.getPlayer();
                    Action a3 = new Action(tmp3);
                    this.pastLog(a3);
                    if(tmp3.getTeam() == 1) team1.add(tmp3);
                    else team2.add(tmp3);
                    break;

                case "Rename": // Recreate name
                    Player tmp4 = action.getPlayer();
                    Action a4 = new Action(tmp4.getName(), tmp4);
                    this.pastLog(a4);
                    tmp4.setName(action.getContent());
                    break;
            }


            // Remove the action from the future list
            this.future.remove(action);
        }

    }

}
