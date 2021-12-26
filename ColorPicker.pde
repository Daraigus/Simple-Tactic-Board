class ColorPicker extends Button {

    final color BGCOLOR = color(28,32,36);
    final color PINGCOLOR = color(255,0,0);
    final color BRIGHTSTRIPECOLOR = color(86,110,72);
    final color DARKSTRIPECOLOR = color(93,120,78);
    final color _RED = color(255,89,94);
    final color _BLUE = color(0,124,190);
    final color _YELLOW = color(255,214,57);
    final color _MAUVE = color(224,123,224);
    final color _LAVENDER = color(220,204,255);
    final color _EGG = color(250,243,221);
    final color _KHAKI = color(195,169,149);

    private int currentID;
    private color currentColor;
    private color[] colorPicker;

    ColorPicker(){
        super(width/2,height-65,75,50);
        this.currentID = 0;
        this.currentColor = _RED;
        this.colorPicker = new color[] {
            _RED,
            _BLUE,
            _YELLOW,
            _MAUVE,
            _LAVENDER,
            _EGG,
            _KHAKI
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

    void drawButton() {
        rectMode(CENTER);
        stroke(this.strokeCol);
        fill(this.currentColor);
		strokeWeight(2);
		rect(this.x, this.y, this.w, this.h);
    }

}

