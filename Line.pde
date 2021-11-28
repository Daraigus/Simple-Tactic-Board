class Line
{

	private final float ratio = 35;
	final private float tokenRadius = 1.5*this.ratio;

	private float x1,y1,x2,y2;

	private color col;


	Line(float x, float y, float xx, float yy) {
		this.x1 = x;
		this.y1 = y;
		this.x2 = xx;
		this.y2 = yy;
		this.col = color(214, 200, 45);
	}


	void drawLine(){
		stroke(this.col);
		strokeWeight(8);
		line(this.x1, this.y1, this.x2, this.y2);
	}

	boolean overLine(float x, float y) {
		if ( x >= this.x1 && x <= this.x2 && y >= this.y1 && y <= this.y2 )   { return true; } // Trait vers bas droite
		if ( x >= this.x1 && x <= this.x2 && y <= this.y1 && y >= this.y2 )   { return true; } // Trait vers haut droite
		if ( x <= this.x1 && x >= this.x2 && y >= this.y1 && y <= this.y2 )   { return true; } // Trait vers bas gauche
		if ( x <= this.x1 && x >= this.x2 && y <= this.y1 && y >= this.y2 )   { return true; } // Trait vers haut gauche
		return false;
	}



	// GETTERS SETTERS
	public float getX1() {
		return this.x1;
	}

	public float getY1() {
		return this.y1;
	}

	public void setX1(float xx) {
		this.x1 = xx;
	}

	public void setY1(float yy) {
		this.y1 = yy;
	}

	public float getX2() {
		return this.x2;
	}

	public float getY2() {
		return this.y2;
	}

	public void setX2(float xx) {
		this.x2 = xx;
	}

	public void setY2(float yy) {
		this.y2 = yy;
	}


	public color getColor() {
		return this.col;
	}

	public void setColor(color c) {
		this.col = c;
	}

}
