class Button {

    protected int x,y;
    protected int w, h;
    protected color strokeCol = color(255);
    protected color fillCol;

    Button(int xx, int yy, int ww, int hh){
        this.x = xx;
        this.y = yy;
        this.w = ww;
        this.h = hh;
    }

    void drawButton() {
        rectMode(CENTER);
        stroke(this.strokeCol);
        fill(this.fillCol);
        strokeWeight(2);
        rect(this.x, this.y, this.w, this.h);
    }


	boolean overButton(float xx, float yy) {
		if ( xx >= this.x - this.w && xx <= this.x + this.w && yy >= this.y - this.h && yy <= this.y + this.h )   { return true; } 
		return false;
	}


    public int getX() {
        return this.x;
    }

    public int getY() {
        return this.y;
    }

    public int getH() {
        return this.h;
    }

    public int getW() {
        return this.w;
    }

    public void setW(int ww) {
        this.w = ww;
    }

    public void setH(int hh) {
        this.h = hh;
    }


}

