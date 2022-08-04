class Circle
{

	private final float ratio = 35*heightScaling;
	final private float tokenRadius = (1.5*this.ratio)*heightScaling;

	private float x1,y1,x2,y2;
	private float xCenter, yCenter;

	private color col;
    private color col2;


	Circle(float x, float y, float xx, float yy) {
		this.x1 = x;
		this.y1 = y;
		this.x2 = xx;
		this.y2 = yy;
		this.findCenter();
		this.col = CP.getCurrentColor();
        this.col2 = this.col-25;
	}

	Circle(Circle r) {
		this.x1 = r.getX1();
		this.y1 = r.getY1();
		this.x2 = r.getX2();
		this.y2 = r.getY2();
		this.xCenter = r.getXCenter();
		this.yCenter = r.getYCenter();
		this.col = r.getColor();
        this.col2 = r.getColor()-25;
	}


	void drawCircle(){
        ellipseMode(CORNERS);
		stroke(this.col);
        fill(this.col2, 128);
		strokeWeight(4);
		ellipse(this.x1, this.y1, this.x2, this.y2);

		// Draw center
		// ellipseMode(CENTER);
		// ellipse(this.xCenter, this.yCenter, 20, 20);
	}

	boolean overCircle(float x, float y) {
		if (dist(x, y, this.xCenter, this.yCenter) <= Math.abs((x2-x1)/2)) return true;
		return false;
	}


	private void findCenter() {
		if(this.x1 <= this.x2) this.xCenter = ((this.x2-this.x1)/2)+this.x1;
		else if(this.x1 > this.x2) this.xCenter = ((this.x1-this.x2)/2)+this.x2;
		if(this.y1 <= this.y2) this.yCenter = ((this.y2-this.y1)/2)+this.y1;
		else if (this.y1 > this.y2) this.yCenter = ((this.y1-this.y2)/2)+this.y2;
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

	public float getXCenter() {
		return this.xCenter;
	}

	public float getYCenter() {
		return this.yCenter;
	}


	public color getColor() {
		return this.col;
	}

	public void setColor(color c) {
		this.col = c;
	}

}
