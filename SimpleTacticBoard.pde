import java.util.Collections;
import garciadelcastillo.dashedlines.*;

final int ratio = 13;
final float largeurTerrain = 105;
final float hauteurTerrain = 68;

final int width = 1920;
final int height = 1080;

DashedLines dash;

boolean INPUTMODE;
boolean INPUTPLAYER;
boolean INPUTTEXT;


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

PShape moveSVG, undoSVG, redoSVG;
PShape freeTextSVG, lineSVG, dashLineSVG, arrowSVG, circleSVG, squareSVG, eraserSVG;
PImage team1SVG, team2SVG, renameSVG, quitSVG;
PShape cleanSVG;

Histo histo;

void setup() {
	frameRate(60);
	fullScreen();

	initData(); // Init les SVG du dossier data

	dash = new DashedLines(this);

	background(255);
	fill(0);

	field = new Field(11);

	computeCoordinates();

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

	names = loadStrings("initNames.txt");

	ui = new UI();

	initPlayerSetup();
	initUI();

	ui.first().toggle();

	histo = new Histo();

}



void draw() {

	resetBG();
	field.drawField();
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
	int spaceBetweenElements = 70;
	int leftX = 295;

	ui.addToUI(new ButtonM(leftX, height-65, "Move", moveSVG));

	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*2, height-65, "Undo", undoSVG));
	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*3, height-65, "Redo", redoSVG));

	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*5, height-65, "Text", freeTextSVG));
	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*6, height-65, "Line", lineSVG));
	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*7, height-65, "Dash", dashLineSVG));
	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*8, height-65, "Arrow", arrowSVG));
	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*9, height-65, "Circle", circleSVG));
	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*10, height-65, "Square", squareSVG));
	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*11, height-65, "Eraser", eraserSVG));

	// Color Picker
	CP.setX(leftX + spaceBetweenElements*12); CP.setY(height-65); CP.setH(50); CP.setW(50);


	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*14, height-65, "Team1", team1SVG));
	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*15, height-65, "Team2", team2SVG));
	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*16, height-65, "Rename", renameSVG));
	ui.addToUI(new ButtonM(leftX + spaceBetweenElements*19, height-65, "Clean", cleanSVG));

	ui.addToUI(new ButtonM(width-26, 25, "X", quitSVG));
}

void initData(){

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
	coor1[0][0] = 330; // GK
	coor1[0][1] = 540;

	coor1[1][0] = 540; // 2
	coor1[1][1] = 880;

	coor1[2][0] = 500; // 3
	coor1[2][1] = 670;

	coor1[3][0] = 500; // 4
	coor1[3][1] = 410;

	coor1[4][0] = 540; // 5
	coor1[4][1] = 200;

	coor1[5][0] = 810; // 6
	coor1[5][1] = 390;

	coor1[6][0] = 1200; // 7
	coor1[6][1] = 250;

	coor1[7][0] = 810; // 8
	coor1[7][1] = 690;

	coor1[8][0] = 1400; // 9
	coor1[8][1] = 540;

	coor1[9][0] = 1200; // 10
	coor1[9][1] = 540;

	coor1[10][0] = 1200; // 11
	coor1[10][1] = 830;

	// TEAM 2 - 433
	coor2[0][0] = 1590; // GK
	coor2[0][1] = 540;

	coor2[1][0] = 1380; // 2
	coor2[1][1] = 200;

	coor2[2][0] = 1420; // 3
	coor2[2][1] = 410;

	coor2[3][0] = 1420; // 4
	coor2[3][1] = 670;

	coor2[4][0] = 1380; // 5
	coor2[4][1] = 880;

	coor2[5][0] = 1060; // 6
	coor2[5][1] = 540;

	coor2[6][0] = 910; // 7
	coor2[6][1] = 680;

	coor2[7][0] = 910; // 8
	coor2[7][1] = 400;

	coor2[8][0] = 550; // 9
	coor2[8][1] = 540;

	coor2[9][0] = 600; // 10
	coor2[9][1] = 250;

	coor2[10][0] = 600; // 11
	coor2[10][1] = 830;

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
