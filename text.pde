class Text
{

    private int x,y;
    private color col;
    private String txt;

    Text(int xx, int yy, String t) {
        this.x = xx;
        this.y = yy;
        this.txt = t;
        this.col = CP.getCurrentColor();
    }

    Text(Text t) {
        this.x = t.getX();
        this.y = t.getY();
        this.txt = t.getTxt();
        this.col = t.getColor();
    }

    public void drawText() {
        fill(this.col);
        textAlign(CENTER);
        textSize(25);
        text(this.txt.toUpperCase(), this.x, this.y);
    }

    public boolean overText(int xx, int yy) {
        if (dist(xx, yy, this.x, this.y) < 30) return true;
        else if (xx >= this.x - ((this.txt.length()/2)*20) && xx <= this.x + ((this.txt.length()/2)*20) && yy >= this.y - 10 && yy <= this.y + 10) return true;
        return false;
    }

    // GETTERS SETTERS
    public int getX() {
        return this.x;
    }

    public int getY() {
        return this.y;
    }

    public void setX(int xx) {
        this.x = xx;
    }

    public void setY(int yy) {
        this.y = yy;
    }

    public String getTxt() {
        return this.txt;
    }

    public void setTxt(String t) {
        this.txt = t;
    }


    public color getColor() {
        return this.col;
    }

    public void setColor(color c) {
        this.col = c;
    }

}
