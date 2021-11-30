class DashLine extends Line
{

	DashLine(float x, float y, float xx, float yy) {
		super(x,y,xx,yy);
	}

    void drawLine(){
		stroke(this.col);
		strokeWeight(4);
        dash.line(this.x1, this.y1, this.x2, this.y2);
	}

}
