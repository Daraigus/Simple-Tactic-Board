class DashLine extends Line
{

	DashLine(int x, int y, int xx, int yy) {
		super(x,y,xx,yy);
		this.strokeWeight = 4;
	}

    void drawLine(){
		stroke(this.col);
		strokeWeight(this.strokeWeight);
        dash.line(this.x1, this.y1, this.x2, this.y2);
	}

}
