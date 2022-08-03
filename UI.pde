class UI {

    private ArrayList<Button> buttons;

    private int activeButtonID;

    UI(){
        this.buttons = new ArrayList<Button>();
        
        this.activeButtonID = 0;
    }

    public boolean overUI(int xx, int yy) {
        for(int i = 0; i < buttons.size(); i++) {
            if (buttons.get(i).overButton(xx,yy)) return true;
        }
        return false;
    }

    public void clickHandler() {

    }

    public String getToggledElement() {
        for(int i = 0; i < buttons.size(); i++) {
            if (buttons.get(i).isToggled()) return buttons.get(i).getLabel();
        }
        return "";
    }

    public void drawUI() {
        for(int i = 0; i < buttons.size(); i++) {
            buttons.get(i).drawButton();
        }
    }

    public void addToUI(Button b) {
        this.buttons.add(b);
    }

    public Button get(int i) {
        return this.buttons.get(i);
    }

    public Button first() {
        return this.buttons.get(0);
    }

}