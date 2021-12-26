class ButtonB extends Button {

    ButtonB(int xx, int yy) {
        super(xx,yy,50,50);
    }

	void drawButton() {
        rectMode(CENTER);
        stroke(this.strokeCol);
        fill(75);
        strokeWeight(2);
        rect(this.x, this.y, this.w, this.h);
    }


}

