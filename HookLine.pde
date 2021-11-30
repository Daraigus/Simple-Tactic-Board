class HookLine extends Line
{

    protected Player p1, p2;

	HookLine(Player p1, Player p2) {
		super(p1.getX(), p1.getY(), p2.getX(), p2.getY());
    this.p1 = p1;
    this.p2 = p2;
	}

    void drawLine(){
		stroke(this.col);
		strokeWeight(8);
        updateHookCoordinates();
		line(this.x1, this.y1, this.x2, this.y2);
	}

    void updateHookCoordinates() {
        if(p1 != null && p2 != null) {
            this.x1 = p1.getX();
            this.y1 = p1.getY();
            this.x2 = p2.getX();
            this.y2 = p2.getY();
        }
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
