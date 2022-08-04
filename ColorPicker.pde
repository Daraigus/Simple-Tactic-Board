
class ColorPicker {

    color BGCOLOR = color(28,32,36);
    color PINGCOLOR = color(255,0,0);
    color BRIGHTSTRIPECOLOR = color(86,110,72);
    color DARKSTRIPECOLOR = color(93,120,78);
    color RED = color(255,89,94);
    color BLUE = color(0,124,190);
    color YELLOW = color(255,214,57);
    color MAUVE = color(224,123,224);
    color LAVENDER = color(220,204,255);
    color EGG = color(250,243,221);
    color KHAKI = color(195,169,149);

    color WHITE = color(255);
    color BLACK = color(0);

    private int currentID;
    private color currentColor;
    private color[] colorPicker;
    private color strokeCol = color(255);

    private int x,y,w,h;

    ColorPicker(){
        this.currentID = 0;
        this.currentColor = RED;
        this.colorPicker = new color[] {
            RED,
            BLUE,
            YELLOW,
            MAUVE,
            LAVENDER,
            EGG,
            KHAKI
        };
    }

    public color getCurrentColor() {
        return this.currentColor;
    }

    public void computeNextColor() {
        this.currentID++;
        if (this.currentID > 6) this.currentID = 0;
        this.currentColor = this.colorPicker[this.currentID];
    }

    public boolean overColorPicker(int xx, int yy) {
		if ( xx >= this.x - this.w && xx <= this.x + this.w && yy >= this.y - this.h && yy <= this.y + this.h ) return true;
		return false;
    }

    void drawColorPicker() {
        rectMode(CENTER);
        stroke(this.strokeCol);
        fill(this.currentColor);
		strokeWeight(2);
		rect(this.x, this.y, this.w, this.h);
    }


    void setX(int xx) {
        this.x = xx;
    }

    void setY(int yy) {
        this.y = yy;
    }

    void setH(int hh) {
        this.h = hh;
    }

    void setW(int ww) {
        this.w = ww;
    }

}
