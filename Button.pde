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
        this.w = (int)(ww*widthScaling);
        this.h = (int)(hh*heightScaling);
        this.label = l;
        this.toggled = false;
    }

    Button(int xx, int yy, int ww, int hh, String l, PShape ic){
        this.x = xx;
        this.y = yy;
        this.w = (int)(ww*widthScaling);
        this.h = (int)(hh*heightScaling);
        this.label = l;
        this.toggled = false;
        this.icon = ic;
    }

    Button(int xx, int yy, int ww, int hh, String l, PImage im){
        this.x = xx;
        this.y = yy;
        this.w = (int)(ww*widthScaling);
        this.h = (int)(hh*heightScaling);
        this.label = l;
        this.toggled = false;
        this.image = im;
    }

    void drawButton() {
        if(this.toggled || (this.overButton(mouseX,mouseY) && !mouseLocked)) {
            rectMode(CENTER);
            stroke(0);
            fill(this.fillCol-50);
            strokeWeight(2);
            rect(this.x, this.y, this.w, this.h);
            fill(0);

            if (this.icon != null) {
                // Affichage icône
                shape(this.icon, this.x-(20*widthScaling), this.y-(20*heightScaling), 40*widthScaling,40*heightScaling);
            } else if (this.image != null) {
                // Affichage image
                image(this.image, this.x-(20*widthScaling), this.y-(20*heightScaling), 40*widthScaling,40*heightScaling);
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
                shape(this.icon, this.x-(20*widthScaling), this.y-(20*heightScaling), 40*widthScaling,40*heightScaling);
            } else if (this.image != null) {
                // Affichage image
                image(this.image, this.x-(20*widthScaling), this.y-(20*heightScaling), 40*widthScaling,40*heightScaling);
            } else {
                // Affichage texte
                textAlign(CENTER);
                textSize(20);
                text(this.label, this.x, this.y + (10*heightScaling));
            }
        }
        
    }


	boolean overButton(int xx, int yy) {
		if ( xx >= this.x - this.w/2 && xx <= this.x + this.w/2 && yy >= this.y - this.h/2 && yy <= this.y + this.h/2 ) { 
            return true; 
        } 
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

    public void setX(int xx) {
        this.x = xx;
    }

    public void setY(int yy) {
        this.y = yy;
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
