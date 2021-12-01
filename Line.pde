class Line
{

	protected final int strokeWeight = 8;

	protected int x1,y1,x2,y2;

	protected color col;


	Line(int x, int y, int xx, int yy) {
		this.x1 = x;
		this.y1 = y;
		this.x2 = xx;
		this.y2 = yy;
		this.col = color(214, 200, 45);
	}


	void drawLine(){
		stroke(this.col);
		strokeWeight(this.strokeWeight);
		line(this.x1, this.y1, this.x2, this.y2);
	}

	boolean overLine(float xx, float yy) {
		// if ( x >= this.x1 && x <= this.x2 && y >= this.y1 && y <= this.y2 )   { return true; } // Trait vers bas droite
		// if ( x >= this.x1 && x <= this.x2 && y <= this.y1 && y >= this.y2 )   { return true; } // Trait vers haut droite
		// if ( x <= this.x1 && x >= this.x2 && y >= this.y1 && y <= this.y2 )   { return true; } // Trait vers bas gauche
		// if ( x <= this.x1 && x >= this.x2 && y <= this.y1 && y >= this.y2 )   { return true; } // Trait vers haut gauche
		// return false;

		println("x1 = " + this.x1 + " y1 = " + this.y1);
		println("x2 = " + this.x2 + " y2 = " + this.y2);
		println("xx = " + xx + " yy = " + yy);

		int xx1 = this.x1;
		int xx2 = this.x2;
		int yy1 = this.y1;
		int yy2 = this.y2;

		if(approximatelyEqual(xx1, xx2, 1)) { // Si vertical
			if(yy1 > yy2) {
				return (approximatelyEqual(xx1, xx, 1) && (yy-5 <= yy1) && (yy+5 >= yy2)); // Trait vers le haut
			} else {
				return (approximatelyEqual(xx1, xx, 1) && (yy-5 <= yy2) && (yy+5 >= yy1)); // Trait vers le bas
			}
		} else if (approximatelyEqual(yy1, yy2, 2)) { // Si horizontal
			if(xx1 > xx2) {
				return (approximatelyEqual(yy1, yy, 1) && (xx-5 <= xx1) && (xx+5 >= xx2)); // Trait vers la gauche
			} else {
				return (approximatelyEqual(yy1, yy, 1) && (xx-5 <= xx2) && (xx+5 >= xx1)); // Trait vers la droite
			}
		} else { // Si ni horizontal, ni vertical
			println("autre");
			int top = yy2 - yy1;
			int bot = xx2 - xx1;
			println(top);
			float mtmp = top/bot;
			println(mtmp);
			int m = (int) mtmp;
			int b;
			if(m != 0) {
				b = yy1/(m*xx1);
			} else {
				b = yy1;
			}
				

			println("y = " + m + "x + " + b);
			println("------------------------------");

			if(yy < (m*xx)+b + 5 && yy > (m*xx)+b - 5 && xx < (yy-b)/m + 5 && xx > (yy-b)/m - 5) {
			// if(approximatelyEqual((m*xx)+b,yy,10)) {
				println("true");
				return true;
			}
		}
		

		return false;
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
