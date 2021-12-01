import java.util.Collections;
import java.util.Random;
import garciadelcastillo.dashedlines.*;

final int ratio = 13;
final float largeurTerrain = 105;
final float hauteurTerrain = 68;

final color BGCOLOR = color(28, 32, 36);
final color PINGCOLOR = color(255,0,0);

DashedLines dash;

boolean INPUTMODE;


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

ArrayList<Arrow> arrows;
ArrayList<Line> lines;
ArrayList<Rect> rects;

Ball ball;

int[][] coor1 = new int[11][2];
int[][] coor2 = new int[11][2];




void setup() {
	frameRate(60);
	fullScreen(1);

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

	arrows = new ArrayList<Arrow>();
	lines = new ArrayList<Line>();
	rects = new ArrayList<Rect>();

	ball = new Ball(255, width/2, height/2);

	INPUTMODE = false;

	initPlayerSetup();

}



void draw() {

	reset();
	field.drawField();

	drawRects();
	drawArrows();
	drawLines();
	drawPlayers();
	ball.drawBall();


	if(INPUTMODE) {
		runInputMode();
	} else {
		runEventManager();
	}

}



void reset() {
	background(BGCOLOR); // Background de reset
}

void drawPlayers() {
	if(!team1.isEmpty()) {
		for(int i = 0; i < team1.size(); i++) {
			team1.get(i).drawPlayer();
		}
	}

	if(!team2.isEmpty()) {
		for(int i = 0; i < team2.size(); i++) {
			team2.get(i).drawPlayer();
		}
	}
}

void drawArrows() {
	if(!arrows.isEmpty()) {
		for(int i = 0; i < arrows.size(); i++) {
			arrows.get(i).drawArrow();
		}
	}
}

void drawLines() {
	if(!lines.isEmpty()) {
		for(int i = 0; i < lines.size(); i++) {
			lines.get(i).drawLine();
		}
	}
}

void drawRects() {
	if(!rects.isEmpty()) {
		for(int i = 0; i < rects.size(); i++) {
			rects.get(i).drawRect();
		}
	}
}

void initPlayerSetup() {

	initPlayerCoordinates();

	for (int i=0; i < 11; i++) {
		computeNextJerseyNumber(1);
		team1.add(new Player("Joueur " + team1NextJerseyNumber, 1, team1NextJerseyNumber, coor1[i][0], coor1[i][1]));
		team1JerseyNumbers.add(team1NextJerseyNumber);

		computeNextJerseyNumber(2);
		team2.add(new Player("Joueur " + team2NextJerseyNumber, 2, team2NextJerseyNumber, coor2[i][0], coor2[i][1]));
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
