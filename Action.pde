class Action {

    // Action name
    private String action;

    // Position
    private int x,y;

    // Potential objects
    private Player player = null;
    private Ball ball = null;
    private Line line = null;
    private DashLine dashLine = null;
    private Arrow arrow = null;
    private HookLine hookLine = null;
    private Rect rect = null;
    private Circle circle = null;

    private Player player2 = null;
    private Ball ball2 = null;
    private Line line2 = null;
    private DashLine dashLine2 = null;
    private Arrow arrow2 = null;
    private HookLine hookLine2 = null;
    private Rect rect2 = null;
    private Circle circle2 = null;

    // Text
    private String contenu;
    private String type;

    // Color
    private color col;

    // Move
    Action(String a, int xx, int yy, Object o) {
        this.action = a;
        this.x = xx;
        this.y = yy;

        if(o instanceof Player) {
            this.player = new Player(o);
        } else if(o instanceof Ball) {
            this.ball = new Ball(o);
        } else if(o instanceof Line) {
            this.line = new Line(o);
        } else if(o instanceof DashLine) {
            this.dashLine = new DashLine(o);
        } else if(o instanceof Arrow) {
            this.arrow = new Arrow(o);
        } else if(o instanceof HookLine) {
            this.hookLine = new HookLine(o);
        } else if(o instanceof Rect) {
            this.rect = new Rect(o);
        } else if(o instanceof Circle) {
            this.circle = new Circle(o);
        }
    }

    // Free Text
    Action(String a, int xx, int yy, String c, color col) {
        this.action = a;
        this.x = xx;
        this.y = yy;
        this.contenu = contenu;
        this.col = col;
    }

    // Draw
    Action(String a, int xx, int yy, String t, color col) {
        this.action = a;
        this.x = xx;
        this.y = yy;
        this.type = t;
        this.col = col;
    }

    // Draw Hook
    Action(String a, String t, Object o1, Object o2) {
        this.action = a;
        this.type = t;

        if(o1 instanceof Player) {
            this.player = new Player(o1);
            this.player2 = new Player(o2);
        } else if(o1 instanceof Ball) {
            this.ball = new Ball(o1);
            this.ball2 = new Ball(o2);
        } else if(o1 instanceof Line) {
            this.line = new Line(o1);
            this.line2 = new Line(o2);
        } else if(o1 instanceof DashLine) {
            this.dashLine = new DashLine(o1);
            this.dashLine2 = new DashLine(o2);
        } else if(o1 instanceof Arrow) {
            this.arrow = new Arrow(o1);
            this.arrow2 = new Arrow(o2);
        } else if(o1 instanceof HookLine) {
            this.hookLine = new HookLine(o1);
            this.hookLine2 = new HookLine(o2);
        } else if(o1 instanceof Rect) {
            this.rect = new Rect(o1);
            this.rect2 = new Rect(o2);
        } else if(o1 instanceof Circle) {
            this.circle = new Circle(o1);
            this.circle2 = new Circle(o2);
        }
    }

    // Player
    Action(String a, Player p) {
        this.action = a;
        this.player = new Player(p);
    }

    // Rename
    Action(String a, Player p) {
        this.action = a;
        this.player = new Player(p);
    }

}