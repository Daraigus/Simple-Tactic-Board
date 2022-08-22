import java.util.Collections;
import garciadelcastillo.dashedlines.*;

final int ratio = 13; // How many stripes
float largeurTerrain; // Stripe width
float hauteurTerrain; // Stripe height

DashedLines dash;

boolean INPUTMODE;
boolean INPUTPLAYER;
boolean INPUTTEXT;

boolean HELPMODE;

Field field;

boolean resetCheck = true;
boolean drawGUICheck = false;

int team1NextJerseyNumber;
int team2NextJerseyNumber;
ArrayList<Integer> team1JerseyNumbers;
ArrayList<Integer> team2JerseyNumbers;
ArrayList<Integer> team1FreeJerseyNumbers;
ArrayList<Integer> team2FreeJerseyNumbers;

ArrayList<Player> team1;
ArrayList<Player> team2;

ArrayList<Line> lines;
ArrayList<Rect> rects;
ArrayList<Circle> circles;
ArrayList<Text> texts;

Ball ball;

int[][] coor1 = new int[11][2];
int[][] coor2 = new int[11][2];
String[] names;

ColorPicker CP = new ColorPicker();
UI ui;
ToolTip tooltip;
String LANGUAGE;

PShape moveSVG, undoSVG, redoSVG;
PShape freeTextSVG, lineSVG, dashLineSVG, arrowSVG, circleSVG, squareSVG, eraserSVG;
PImage team1SVG, team2SVG, renameSVG, quitSVG, helpSVG;
PShape cleanSVG;

PImage LOGO;

Histo histo;

float widthScaling, heightScaling;

//previous width/height
float pWidth, pHeight;

void setup() {
	frameRate(60);
	fullScreen();
	// size(3840,2160);
	// size(2560,1440);
	// size(1920,1080);
	// size(1280,720);
	// size(800,600);

	initData(); // Init les SVG du dossier data
	
	surface.setResizable(true);
	surface.setTitle("Simple Tactics Board");
	// surface.setIcon(LOGO); // Not ready yet

	

	dash = new DashedLines(this);

	background(255);
	fill(0);

	LANGUAGE = "French";

	initScaling(width, height);
	computeCoordinates();
	field = new Field(11);

	team1 = new ArrayList<Player>();
	team2 = new ArrayList<Player>();

	team1JerseyNumbers = new ArrayList<Integer>();
	team2JerseyNumbers = new ArrayList<Integer>();
	team1FreeJerseyNumbers = new ArrayList<Integer>();
	team2FreeJerseyNumbers = new ArrayList<Integer>();

	lines = new ArrayList<Line>();
	rects = new ArrayList<Rect>();
	circles = new ArrayList<Circle>();
	texts = new ArrayList<Text>();

	ball = new Ball(255, width/2, height/2);

	INPUTMODE = false;
	INPUTPLAYER = false;
	INPUTTEXT = false;

	HELPMODE = false;

	names = loadStrings("initNames.txt");

	ui = new UI();
	tooltip = new ToolTip();

	initPlayerSetup();
	initUI();

	ui.first().toggle();

	histo = new Histo();

}



void draw() {
	
  	// updateWindowResized();

	resetBG();
	field.drawField();

	computeTexts();
	drawUI();

	drawRects();
	drawCircles();
	drawLines();
	drawPlayers(CP);
	ball.drawBall();
	drawTexts();
	


	if(INPUTMODE) {
		runInputMode();
	} else {
		runEventManager();
	}

}


void resetBG() {
	background(CP.BGCOLOR); // Background de reset
}

void drawUI() {
	if (HELPMODE) tooltip.drawToolTip();
	CP.drawColorPicker();
	ui.drawUI();
}

void drawPlayers(ColorPicker CP) {
	if(!team1.isEmpty()) {
		for(int i = team1.size()-1; i >= 0; i--) {
			team1.get(i).drawPlayer(CP);
		}
	}

	if(!team2.isEmpty()) {
		for(int i = team2.size()-1; i >= 0; i--) {
			team2.get(i).drawPlayer(CP);
		}
	}
}

void drawLines() {
	if(!lines.isEmpty()) {
		for(int i = lines.size()-1; i >= 0; i--) {
			lines.get(i).drawLine();
		}
	}
}

void drawRects() {
	if(!rects.isEmpty()) {
		for(int i = rects.size()-1; i >= 0; i--) {
			rects.get(i).drawRect();
		}
	}
}

void drawCircles() {
	if(!circles.isEmpty()) {
		for(int i = circles.size()-1; i >= 0; i--) {
			circles.get(i).drawCircle();
		}
	}
}

void drawTexts() {
	if(!texts.isEmpty()) {
		for(int i = texts.size()-1; i >= 0; i--) {
			texts.get(i).drawText();
		}
	}
}

void initUI() {
	int spaceBetweenElements = (int)(75*widthScaling);
	// int leftX = (int)(295*widthScaling);
	int leftX = (int)(fieldTopLeftCornerX+(25*widthScaling));

	ui.addToUI(new ButtonM(leftX, (int)(height-(65*heightScaling)), "Move", moveSVG));

	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*2, (int)(height-(65*heightScaling)), "Undo", undoSVG));
	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*3, (int)(height-(65*heightScaling)), "Redo", redoSVG));

	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*5, (int)(height-(65*heightScaling)), "Text", freeTextSVG));
	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*6, (int)(height-(65*heightScaling)), "Line", lineSVG));
	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*7, (int)(height-(65*heightScaling)), "Dash", dashLineSVG));
	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*8, (int)(height-(65*heightScaling)), "Arrow", arrowSVG));
	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*9, (int)(height-(65*heightScaling)), "Circle", circleSVG));
	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*10, (int)(height-(65*heightScaling)), "Square", squareSVG));
	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*11, (int)(height-(65*heightScaling)), "Eraser", eraserSVG));

	// Color Picker
	CP.setX(leftX + spaceBetweenElements*12); CP.setY((int)(height-(65*heightScaling))); CP.setH((int)(50*widthScaling)); CP.setW((int)(50*heightScaling));


	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*14, (int)(height-(65*heightScaling)), "Team1", team1SVG));
	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*15, (int)(height-(65*heightScaling)), "Team2", team2SVG));
	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*16, (int)(height-(65*heightScaling)), "Rename", renameSVG));
	
	ui.addToUI(new ButtonM((int)(fieldBottomRightCornerX-(25*widthScaling)), (int)(height-(65*heightScaling)), "Clean", cleanSVG));

	ui.addToUI(new ButtonM((int)(width-(30*widthScaling)), (int)(30*heightScaling), "X", quitSVG));

	ui.addToUI(new ButtonM(0, (int)(650*heightScaling), "Help", helpSVG));
}

void initData(){

	LOGO = loadImage("logo.png");

	moveSVG = loadShape("move.svg");

	undoSVG = loadShape("undo.svg");
	redoSVG = loadShape("redo.svg");

	freeTextSVG = loadShape("freeText.svg");
	lineSVG = loadShape("line.svg");
	dashLineSVG = loadShape("dashLine.svg");
	arrowSVG = loadShape("arrow.svg");
	circleSVG = loadShape("circle.svg");
	squareSVG = loadShape("square.svg");
	eraserSVG = loadShape("eraser.svg");

	team1SVG = loadImage("team1.png");
	team2SVG = loadImage("team2.png");
	renameSVG = loadImage("rename.png");

	cleanSVG = loadShape("clean.svg");

	quitSVG = loadImage("quit.png");

	helpSVG = loadImage("help2.png");
	
}

void initPlayerSetup() {

	initPlayerCoordinates();

	for (int i=0; i < 11; i++) {
		computeNextJerseyNumber(1);
		team1.add(new Player(names[i], 1, team1NextJerseyNumber, coor1[i][0], coor1[i][1]));
		team1JerseyNumbers.add(team1NextJerseyNumber);

		computeNextJerseyNumber(2);
		team2.add(new Player(names[i+11], 2, team2NextJerseyNumber, coor2[i][0], coor2[i][1]));
		team2JerseyNumbers.add(team2NextJerseyNumber);
	}
}



void initPlayerCoordinates() {

	// TEAM 1 - 4231
	coor1[0][0] = (int)(330*widthScaling); // GK
	coor1[0][1] = (int)(540*heightScaling);

	coor1[1][0] = (int)(540*widthScaling); // 2
	coor1[1][1] = (int)(880*heightScaling);

	coor1[2][0] = (int)(500*widthScaling); // 3
	coor1[2][1] = (int)(670*heightScaling);

	coor1[3][0] = (int)(500*widthScaling); // 4
	coor1[3][1] = (int)(410*heightScaling);

	coor1[4][0] = (int)(540*widthScaling); // 5
	coor1[4][1] = (int)(200*heightScaling);

	coor1[5][0] = (int)(810*widthScaling); // 6
	coor1[5][1] = (int)(390*heightScaling);

	coor1[6][0] = (int)(1200*widthScaling); // 7
	coor1[6][1] = (int)(250*heightScaling);

	coor1[7][0] = (int)(810*widthScaling); // 8
	coor1[7][1] = (int)(690*heightScaling);

	coor1[8][0] = (int)(1400*widthScaling); // 9
	coor1[8][1] = (int)(540*heightScaling);

	coor1[9][0] = (int)(1200*widthScaling); // 10
	coor1[9][1] = (int)(540*heightScaling);

	coor1[10][0] = (int)(1200*widthScaling); // 11
	coor1[10][1] = (int)(830*heightScaling);

	// TEAM 2 - 433
	coor2[0][0] = (int)(1590*widthScaling); // GK
	coor2[0][1] = (int)(540*heightScaling);

	coor2[1][0] = (int)(1380*widthScaling); // 2
	coor2[1][1] = (int)(200*heightScaling);

	coor2[2][0] = (int)(1420*widthScaling); // 3
	coor2[2][1] = (int)(410*heightScaling);

	coor2[3][0] = (int)(1420*widthScaling); // 4
	coor2[3][1] = (int)(670*heightScaling);

	coor2[4][0] = (int)(1380*widthScaling); // 5
	coor2[4][1] = (int)(880*heightScaling);

	coor2[5][0] = (int)(1060*widthScaling); // 6
	coor2[5][1] = (int)(540*heightScaling);

	coor2[6][0] = (int)(910*widthScaling); // 7
	coor2[6][1] = (int)(680*heightScaling);

	coor2[7][0] = (int)(910*widthScaling); // 8
	coor2[7][1] = (int)(400*heightScaling);

	coor2[8][0] = (int)(550*widthScaling); // 9
	coor2[8][1] = (int)(540*heightScaling);

	coor2[9][0] = (int)(600*widthScaling); // 10
	coor2[9][1] = (int)(250*heightScaling);

	coor2[10][0] = (int)(600*widthScaling); // 11
	coor2[10][1] = (int)(830*heightScaling);

}

void reset() {

	ball.setX(width/2);
	ball.setY(height/2);

	team1 = new ArrayList<Player>();
	team2 = new ArrayList<Player>();

	team1JerseyNumbers = new ArrayList<Integer>();
	team2JerseyNumbers = new ArrayList<Integer>();
	team1FreeJerseyNumbers = new ArrayList<Integer>();
	team2FreeJerseyNumbers = new ArrayList<Integer>();

	lines = new ArrayList<Line>();
	rects = new ArrayList<Rect>();
	circles = new ArrayList<Circle>();
	texts = new ArrayList<Text>();

	INPUTMODE = false;
	INPUTPLAYER = false;
	INPUTTEXT = false;

	initPlayerSetup();

	histo.clear();
}

void updateWindowResized() {
  	if (width != pWidth || height != pHeight) {
		pWidth = width;
		pHeight = height;
		windowResized();
	}
}

//called when the window was resized 
void windowResized() {
	initScaling(width, height);
	computeCoordinates();
	field = new Field(11);

	ui = new UI();
	tooltip = new ToolTip();

	initUI();

	reset();
 	// initScaling(width, height);
	// computeCoordinates();
	// field = new Field(11);

	// ball = new Ball(255, width/2, height/2);

	// ui = new UI();
	// tooltip = new ToolTip();

	// initUI();

	// // Updating all objects' coordinates
	// for(int i = 0; i < team1.size(); i++){
	// 	team1.get(i).setX((int)(team1.get(i).getX()*widthScaling));
	// 	team1.get(i).setY((int)(team1.get(i).getY()*heightScaling));
	// }

	// for(int i = 0; i < team2.size(); i++){
	// 	team2.get(i).setX((int)(team2.get(i).getX()*widthScaling));
	// 	team2.get(i).setY((int)(team2.get(i).getY()*heightScaling));
	// }
}