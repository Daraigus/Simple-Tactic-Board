class Button {

    protected int x,y;
    protected int w, h;
    protected color strokeCol = color(255);
    protected color fillCol = color(200);
    protected String label;
    protected boolean toggled;

    protected PShape icon = null;
    protected PImage image = null;

    Button(int xx, int yy, int ww, int hh, String l){
        this.x = xx;
        this.y = yy;
        this.w = ww;
        this.h = hh;
        this.label = l;
        this.toggled = false;
    }

    Button(int xx, int yy, int ww, int hh, String l, PShape ic){
        this.x = xx;
        this.y = yy;
        this.w = ww;
        this.h = hh;
        this.label = l;
        this.toggled = false;
        this.icon = ic;
    }

    Button(int xx, int yy, int ww, int hh, String l, PImage im){
        this.x = xx;
        this.y = yy;
        this.w = ww;
        this.h = hh;
        this.label = l;
        this.toggled = false;
        this.image = im;
    }

    void drawButton() {
        if(this.toggled || this.overButton(mouseX,mouseY)) {
            rectMode(CENTER);
            stroke(0);
            fill(this.fillCol-50);
            strokeWeight(2);
            rect(this.x, this.y, this.w, this.h);
            fill(0); // ?

            if (this.icon != null) {
                // Affichage icône
                shape(this.icon, this.x-20, this.y-20, 40,40);
            } else if (this.image != null) {
                // Affichage image
                image(this.image, this.x-20, this.y-20, 40,40);
            } else {
                // Affichage texte
                textAlign(CENTER);
                textSize(20);
                text(this.label, this.x, this.y + 10);
            }
        } else {
            rectMode(CENTER);
            stroke(this.strokeCol);
            fill(this.fillCol);
            strokeWeight(2);
            rect(this.x, this.y, this.w, this.h);
            fill(0); // ?

            if (this.icon != null) {
                // Affichage icône
                shape(this.icon, this.x-20, this.y-20, 40,40);
            } else if (this.image != null) {
                // Affichage image
                image(this.image, this.x-20, this.y-20, 40,40);
            } else {
                // Affichage texte
                textAlign(CENTER);
                textSize(20);
                text(this.label, this.x, this.y + 10);
            }
        }
        
    }


	boolean overButton(float xx, float yy) {
		if ( xx >= this.x - this.w && xx <= this.x + this.w && yy >= this.y - this.h && yy <= this.y + this.h ) { 
            return true; 
        } 
		return false;
	}

    // void onClick() {
    //     this.toggled = !this.toggled;
    // }


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

    public String getLabel() {
        return this.label;
    }

    public void toggle() {
        this.toggled = !this.toggled;
    }

    public boolean isToggled() {
        return this.toggled;
    }


}
