class UI {

    private ArrayList<Button> buttons;
    public int size;

    private int activeButtonID;

    UI(){
        this.buttons = new ArrayList<Button>();
        
        this.activeButtonID = 0;
    }

    public boolean overUI(int xx, int yy) {
        for(int i = 0; i < buttons.size(); i++) {
            if (buttons.get(i).overButton(xx,yy)) return true;
        }
        if (CP.overColorPicker(xx,yy)) return true;
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
        this.size = this.buttons.size();
    }

    public Button get(int i) {
        return this.buttons.get(i);
    }

    public Button first() {
        return this.buttons.get(0);
    }

    public ArrayList<Button> getButtons() {
        return this.buttons;
    }

}