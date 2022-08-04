class Line
{

	protected int strokeWeight = (int)(6*heightScaling);

	protected int x1,y1,x2,y2;

	protected color col;


	Line(int x, int y, int xx, int yy) {
		this.x1 = x;
		this.y1 = y;
		this.x2 = xx;
		this.y2 = yy;
		this.col = CP.currentColor;
	}

	Line(Line l) {
		this.x1 = l.getX1();
		this.y1 = l.getY1();
		this.x2 = l.getX2();
		this.y2 = l.getY2();
		this.col = l.getColor();
	}


	void drawLine(){
		stroke(this.col);
		strokeWeight(this.strokeWeight);
		line(this.x1, this.y1, this.x2, this.y2);
	}

	boolean overLine(int xx, int yy)
	{
		int tolerance = 5;

		double minX = min(this.x1, this.x2) - tolerance;
		double maxX = max(this.x1, this.x2) + tolerance;
		double minY = min(this.y1, this.y2) - tolerance;
		double maxY = max(this.y1, this.y2) + tolerance;

		//Check C is within the bounds of the line
		if (xx >= maxX || xx <= minX || yy <= minY || yy >= maxY)
		{
			return false;
		}

		// Check for when AB is vertical
		if (this.x1 == this.x2)
		{
			if (abs(this.x1 - xx) >= tolerance)
			{
				return false;
			}
			return true;
		}

		// Check for when AB is horizontal
		if (this.y1 == this.y2)
		{
			if (abs(this.y1 - yy) >= tolerance)
			{
				return false;
			}
			return true;
		}


		// Check istance of the point form the line
		double distFromLine = abs(((this.x2 - this.x1)*(this.y1 - yy))-((this.x1 - xx)*(this.y2 - this.y1))) / sqrt((this.x2 - this.x1) * (this.x2 - this.x1) + (this.y2 - this.y1) * (this.y2 - this.y1));

		if (distFromLine >= tolerance)
		{
			return false;
		}
		else
		{
			return true;
		}
	}



	// GETTERS SETTERS
	public int getX1() {
		return this.x1;
	}

	public int getY1() {
		return this.y1;
	}

	public void setX1(int xx) {
		this.x1 = xx;
	}

	public void setY1(int yy) {
		this.y1 = yy;
	}

	public int getX2() {
		return this.x2;
	}

	public int getY2() {
		return this.y2;
	}

	public void setX2(int xx) {
		this.x2 = xx;
	}

	public void setY2(int yy) {
		this.y2 = yy;
	}


	public color getColor() {
		return this.col;
	}

	public void setColor(color c) {
		this.col = c;
	}

}
