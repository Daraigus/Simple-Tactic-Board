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
    private String text;

    // Color
    private color col;

    // Move
    Action(String a, int xx, int yy, Object o) {
        this.action = a;
        this.x = xx;
        this.y = yy;

        if(o instanceof Player) {
            this.player = new Player((Player)o);
        } else if(o instanceof Ball) {
            this.ball = new Ball((Ball)o);
        } else if(o instanceof Line) {
            this.line = new Line((Line)o);
        } else if(o instanceof DashLine) {
            this.dashLine = new DashLine((DashLine)o);
        } else if(o instanceof Arrow) {
            this.arrow = new Arrow((Arrow)o);
        } else if(o instanceof HookLine) {
            this.hookLine = new HookLine((HookLine)o);
        } else if(o instanceof Rect) {
            this.rect = new Rect((Rect)o);
        } else if(o instanceof Circle) {
            this.circle = new Circle((Circle)o);
        }
    }

    // Free Text or draw
    Action(String a, int xx, int yy, String t, color col) {
        this.action = a;
        this.x = xx;
        this.y = yy;
        this.text = t; // Either text or type of Object to draw
        this.col = col;
    }


    // Draw Hook
    Action(String a, String t, Object o1, Object o2) {
        this.action = a;
        this.text = t; // Type of Object to hook

        if(o1 instanceof Player) {
            this.player = new Player((Player)o1);
            this.player2 = new Player((Player)o2);
        } else if(o1 instanceof Ball) {
            this.ball = new Ball((Ball)o1);
            this.ball2 = new Ball((Ball)o2);
        } else if(o1 instanceof Line) {
            this.line = new Line((Line)o1);
            this.line2 = new Line((Line)o2);
        } else if(o1 instanceof DashLine) {
            this.dashLine = new DashLine((DashLine)o1);
            this.dashLine2 = new DashLine((DashLine)o2);
        } else if(o1 instanceof Arrow) {
            this.arrow = new Arrow((Arrow)o1);
            this.arrow2 = new Arrow((Arrow)o2);
        } else if(o1 instanceof HookLine) {
            this.hookLine = new HookLine((HookLine)o1);
            this.hookLine2 = new HookLine((HookLine)o2);
        } else if(o1 instanceof Rect) {
            this.rect = new Rect((Rect)o1);
            this.rect2 = new Rect((Rect)o2);
        } else if(o1 instanceof Circle) {
            this.circle = new Circle((Circle)o1);
            this.circle2 = new Circle((Circle)o2);
        }
    }

    // Player or rename
    Action(String a, Player p) {
        this.action = a;
        this.player = new Player(p);
    }

}