class Histo {

    private ArrayList<Action> past;
    private ArrayList<Action> future;

    Histo() {
        this.past = new ArrayList<Action>();
        this.future = new ArrayList<Action>();
    }

    public void add(Action a) {
        System.out.print("ADDHISTO \n");
        this.past.add(a);
        this.future.clear();
    }

    public void undo() {

        if(this.past.size() != 0) {
            System.out.print("UNDO\n");

            Action action = this.past.get(this.past.size()-1);

            // Record the Action in the future list
            this.future.add(action);

            switch (action.getAction()){

                case "Move": // Revert to old position
                    if(action.getType() == "Player") {
                        Player p = action.getPlayer();
                        p.setX(action.getX());
                        p.setY(action.getY());
                    } else if(action.getType() == "Ball") {
                        Ball b = action.getBall();
                        b.setX(action.getX());
                        b.setY(action.getY());
                    } else {
                        Text t = action.getText();
                        t.setX(action.getX());
                        t.setY(action.getY());
                    }
                    break;

                case "Move2": // Revert to old position but has 2 set of coordinates

                    if(action.getType() == "Line") {
                        Line tmp = action.getLine();
                        tmp.setX1(action.getX());
                        tmp.setY1(action.getY());
                        tmp.setX2(action.getX2());
                        tmp.setY2(action.getY2());
                    } else if(action.getType() == "Dash") {
                        DashLine tmp = action.getDashLine();
                        tmp.setX1(action.getX());
                        tmp.setY1(action.getY());
                        tmp.setX2(action.getX2());
                        tmp.setY2(action.getY2());
                    } else if(action.getType() == "Arrow") {
                        Arrow tmp = action.getArrow();
                        tmp.setX1(action.getX());
                        tmp.setY1(action.getY());
                        tmp.setX2(action.getX2());
                        tmp.setY2(action.getY2());
                    } else if(action.getType() == "Rect") {
                        Rect tmp = action.getRect();
                        tmp.setX1(action.getX());
                        tmp.setY1(action.getY());
                        tmp.setX2(action.getX2());
                        tmp.setY2(action.getY2());
                    } else {
                        Circle tmp = action.getCircle();
                        tmp.setX1(action.getX());
                        tmp.setY1(action.getY());
                        tmp.setX2(action.getX2());
                        tmp.setY2(action.getY2());
                    }
                    break;

                case "Draw": // Delete
                    if(action.getType() == "Line") {
                        Line tmp = action.getLine();
                        lines.remove(tmp);
                    } else if(action.getType() == "Dash") {
                        DashLine tmp = action.getDashLine();
                        lines.remove(tmp);
                    } else if(action.getType() == "Arrow") {
                        Arrow tmp = action.getArrow();
                        lines.remove(tmp);
                    } else if(action.getType() == "Rect") {
                        Rect tmp = action.getRect();
                        rects.remove(tmp);
                    } else {
                        Circle tmp = action.getCircle();
                        circles.remove(tmp);
                    }
                    break;

                case "Hook": // Delete
                    HookLine tmp = action.getHookLine();
                    lines.remove(tmp);
                    break;

                case "Text": // Delete
                    Text tmp2 = action.getText();
                    texts.remove(tmp2);
                    break;

                case "Erase": // Create
                    System.out.print("ERASE\n");
                    if(action.getType() == "Line") {
                        Line tmp5 = action.getLine();
                        lines.add(tmp5);
                    } else if(action.getType() == "Dash") {
                        DashLine tmp5 = action.getDashLine();
                        lines.add(tmp5);
                    } else if(action.getType() == "Arrow") {
                        Arrow tmp5 = action.getArrow();
                        lines.add(tmp5);
                    } else if(action.getType() == "Rect") {
                        Rect tmp5 = action.getRect();
                        rects.add(tmp5);
                    } else if(action.getType() == "Player") {
                        Player tmp5 = action.getPlayer();
                        if (tmp5.getTeam() == 1) team1.add(tmp5);
                        else team2.add(tmp5);
                    } else if(action.getType() == "Text") {
                        Text tmp5 = action.getText();
                        texts.add(tmp5);
                    } else {
                        Circle tmp5 = action.getCircle();
                        circles.add(tmp5);
                    }
                    break;

                case "Player": // Delete from team
                    Player tmp3 = action.getPlayer();
                    if(tmp3.getTeam() == 1) team1.remove(tmp3);
                    else team2.remove(tmp3);
                    break;

                case "Rename": // Revert name
                    Player tmp4 = action.getPlayer();
                    tmp4.setName(action.getContent());
                    break;
            }


            // Remove the action from the past list
            this.past.remove(action);
        }

    }

    public void redo() {
        for(int i = 0; i < this.future.size(); i++) {
            System.out.print(this.future.get(i).getAction() + "\n");
        }
    }

}