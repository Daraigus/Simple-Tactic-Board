class Action {

    // Action name
    private String action;

    // Position
    private int x,y;
    private int x2,y2;

    // Potential objects
    private Player player = null;
    private Ball ball = null;
    private Line line = null;
    private DashLine dashLine = null;
    private Arrow arrow = null;
    private HookLine hookLine = null;
    private Rect rect = null;
    private Circle circle = null;
    private Text text = null;

    private Player player2 = null;

    // Text
    private String type;
    private String content;

    // Color
    private color col;


    // Move
    Action(int xx, int yy, String t, Object o) {
        this.action = "Move";
        this.x = xx;
        this.y = yy;
        this.type = t; // Type of object moved

        if(o instanceof Player) {
            this.player = (Player)o;
        } else if(o instanceof Ball) {
            this.ball = (Ball)o;
        } else if(o instanceof Text) {
            this.text = (Text)o;
        }
    }

    // Move2
    Action(int xx, int yy, int xx2, int yy2, String t, Object o) {
        this.action = "Move2";
        this.x = xx;
        this.y = yy;
        this.x2 = xx2;
        this.y2 = yy2;
        this.type = t; // Type of object moved

        if(o instanceof DashLine) {
            this.dashLine = (DashLine)o;
        } else if(o instanceof Arrow) {
            this.arrow = (Arrow)o;
        } else if(o instanceof Line) {
            this.line = (Line)o;
        } else if(o instanceof Rect) {
            this.rect = (Rect)o;
        } else if(o instanceof Circle) {
            this.circle = (Circle)o;
        }
    }

    // Draw
    Action(String t, Object o) {
        this.action = "Draw";
        this.type = t; // Type of Object to draw

        if(o instanceof DashLine) {
            this.dashLine = (DashLine)o;
        } else if(o instanceof Arrow) {
            this.arrow = (Arrow)o;
        } else if(o instanceof Line) {
            this.line = (Line)o;
        } else if(o instanceof Rect) {
            this.rect = (Rect)o;
        } else if(o instanceof Circle) {
            this.circle = (Circle)o;
        }
    }

    // Draw Hook
    Action(String t, Player o1, Player o2, Object o) {
        this.action = "Hook";
        this.type = t; // Type of Object to hook

        this.player = new Player((Player)o1);
        this.player2 = new Player((Player)o2);

        if(o instanceof HookLine) {
            this.hookLine = (HookLine)o;
        }
    }

    // Erase - VOID is there to differentiate between multiple overcharges of the function (ye ye ik should've used inheritance)
    Action(Object o, int VOID) {
        this.action = "Erase";
        
        if(o instanceof Player) {
            this.player = (Player)o;
            this.type = "Player";
        } else if(o instanceof Text) {
            this.text = (Text)o;
            this.type = "Text";
        } else if(o instanceof Arrow) {
            this.arrow = (Arrow)o;
            this.type = "Arrow";
        } else if(o instanceof DashLine) {
            this.dashLine = (DashLine)o;
            this.type = "Dash";
        } else if(o instanceof Line) {
            this.line = (Line)o;
            this.type = "Line";
        } else if(o instanceof Rect) {
            this.rect = (Rect)o;
            this.type = "Rect";
        } else if(o instanceof Circle) {
            this.circle = (Circle)o;
            this.type = "Circle";
        }
    }

    // Free text
    Action(Text t) {
        this.action = "Text";
        this.text = t;
    }

    // Player
    Action(Player p) {
        this.action = "Player";
        this.player = p;
    }

    // Rename
    Action(String c, Player p) {
        this.action = "Rename";
        this.content = c;
        this.player = p;
    }


    // public Object getObject() {
    //     if (player != null) {
    //         return this.player;
    //     } else if (ball != null) {
    //         return this.ball;
    //     } else if (text != null) {
    //         return this.text;
    //     } else if (line != null) {
    //         return this.line;
    //     } else if (dashLine != null) {
    //         return this.dashLine;
    //     } else if (arrow != null) {
    //         return this.arrow;
    //     } else if (rect != null) {
    //         return this.rect;
    //     } else {
    //         return this.circle;
    //     }
    // }

    public String getAction() {
		return this.action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public int getX() {
		return this.x;
	}

	public void setX(int x) {
		this.x = x;
	}

    public int getY() {
		return this.y;
	}

	public void setY(int y) {
		this.y = y;
	}

    public int getX2() {
		return this.x2;
	}

	public void setX2(int x2) {
		this.x2 = x2;
	}

    public int getY2() {
		return this.y2;
	}

	public void setY2(int y2) {
		this.y2 = y2;
	}

	public Player getPlayer() {
		return this.player;
	}

	public void setPlayer(Player player) {
		this.player = player;
	}

	public Ball getBall() {
		return this.ball;
	}

	public void setBall(Ball ball) {
		this.ball = ball;
	}

    public Text getText() {
		return this.text;
	}

	public void setText(Text text) {
		this.text = text;
	}

	public Line getLine() {
		return this.line;
	}

	public void setLine(Line line) {
		this.line = line;
	}

	public DashLine getDashLine() {
		return this.dashLine;
	}

	public void setDashLine(DashLine dashLine) {
		this.dashLine = dashLine;
	}

	public Arrow getArrow() {
		return this.arrow;
	}

	public void setArrow(Arrow arrow) {
		this.arrow = arrow;
	}

	public HookLine getHookLine() {
		return this.hookLine;
	}

	public void setHookLine(HookLine hookLine) {
		this.hookLine = hookLine;
	}

	public Rect getRect() {
		return this.rect;
	}

	public void setRect(Rect rect) {
		this.rect = rect;
	}

	public Circle getCircle() {
		return this.circle;
	}

	public void setCircle(Circle circle) {
		this.circle = circle;
	}

	public Player getPlayer2() {
		return this.player2;
	}

	public void setPlayer2(Player player2) {
		this.player2 = player2;
	}

	public String getType() {
		return this.type;
	}

	public void setType(String text) {
		this.type = type;
	}

    public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public color getColor() {
		return this.col;
	}

	public void setColor(color col) {
		this.col = col;
	}

}