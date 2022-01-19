class UI {

    private ArrayList<Button> boutons;

    private int activeButtonID;

    UI(){
        this.boutons = new ArrayList<Button>();
        
        this.activeButtonID = 0;
    }

    public boolean overUI(int xx, int yy) {
        for(int i = 0; i < boutons.size(); i++) {
            if (boutons.get(i).overButton(xx,yy)) return true;
        }
        return false;
    }

    public void clickHandler() {

    }

    public String getToggledElement() {
        for(int i = 0; i < boutons.size(); i++) {
            if (boutons.get(i).isToggled()) return boutons.get(i).getLabel();
        }
        return "";
    }

    public void drawUI() {
        for(int i = 0; i < boutons.size(); i++) {
            boutons.get(i).drawButton();
        }
    }

    public void addToUI(Button b) {
        this.boutons.add(b);
    }

}