class ToolTip{
	String mText; 
	int x1;
	int y1; 
    int x2;
	int y2; 
	
	boolean doClip = true;
	
	int myWidth;
	int fontSize = (int)(20*heightScaling);
	
	int rectWidthMargin = (int)(5*widthScaling);
	int rectHeightMargin = (int)(5*heightScaling);
		
	color col = 255;
    color col2 = 200;
			
	ToolTip() {
		this.x1 = (int)(10*widthScaling);
		this.y1 = (int)(623*heightScaling);
        this.x2 = (int)(267*widthScaling);
		this.y2 = (int)(fieldBottomRightCornerY*heightScaling);
	}

    void drawToolTip() {
        if(HELPMODE) {
            this.drawContainer();
            this.drawText();
        }
    }
	
	
	private void drawText() {
	    fill(255);
        textSize(this.fontSize);
        textAlign(CENTER);
        text(tooltipTitle,this.x1+rectWidthMargin, this.y1+((int)(25*heightScaling))-(this.fontSize/2), this.x2-rectWidthMargin-((int)(50*widthScaling)), this.y1+((int)(50*heightScaling)));
        textAlign(LEFT);
        textLeading(20);
        text(tooltipText+"\n"+tooltipShortcut,this.x1+rectWidthMargin, this.y1+rectHeightMargin+((int)(50*heightScaling)), this.x2-rectWidthMargin, this.y2-rectHeightMargin);
	}

	private void drawContainer(){
		rectMode(CORNERS);
		stroke(this.col);
        fill(this.col2, 170);
		strokeWeight(4*heightScaling);
		rect(this.x1, this.y1, this.x2, this.y2);
	}

    void setColor(color c){
		col = c;
	}
}