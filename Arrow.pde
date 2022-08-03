class Arrow extends Line
{

	Arrow(int x, int y, int xx, int yy) {
		super(x,y,xx,yy);
	}

	Arrow(Arrow a) {
		super(a.getX1(), a.getY1(), a.getX2(), a.getY2());
	}


	void drawLine(){
		stroke(this.col);
		strokeWeight(this.strokeWeight);
		line(this.x1, this.y1, this.x2, this.y2);
		pushMatrix();
			translate(this.x2, this.y2);
			float a = atan2(this.x1-this.x2, this.y2-this.y1);
			rotate(a);
			line(0, 0, -20, -20);
			line(0, 0, 20, -20);
		popMatrix();
	}

}
