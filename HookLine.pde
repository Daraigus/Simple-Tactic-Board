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
		strokeWeight(this.strokeWeight);
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
	public Player getP1() {
		return this.p1;
	}

	public Player getP2() {
		return this.p2;
	}

	public void setP1(Player p) {
		this.p1 = p;
	}

	public void setY1(Player p) {
		this.p2 = p;
	}

}
