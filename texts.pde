String tooltipTitle;
String tooltipText;
String tooltipShortcut;

void computeTexts() {
    if(LANGUAGE == "French") {
        switch(toggledButtonID) {
            case 0:
                tooltipTitle = "DEPLACER";
                tooltipText = "Cliquez sur un élément et maintenez pour le déplacer sur le terrain.";
                tooltipShortcut = "\nRACCOURCI : " + toggledButtonID;
                break;
            case 3:
                tooltipTitle = "TEXTE LIBRE";
                tooltipText = "Cliquez sur le terrain pour y créer un texte.\nValidez avec ENTREE votre texte.\nLe reste de l'application n'est pas accessible durant la saisie.";
                tooltipShortcut = "\nRACCOURCI : " + toggledButtonID + "\n" + "COULEUR : ESPACE";
                break;
            case 4:
                tooltipTitle = "TRAIT";
                tooltipText = "Cliquez pour créer la base d'un trait et relâchez pour confirmer son placement.\nLes traits ont une taille minimale.\nVous pouvez attacher un trait entre deux joueurs en le débutant ET terminant sur deux joueurs différents.";
                tooltipShortcut = "\nRACCOURCI : " + toggledButtonID + "\n" + "COULEUR : ESPACE";
                break;
            case 5:
                tooltipTitle = "TIRETS";
                tooltipText = "Cliquez pour créer la base d'un trait composé de tirets et relâchez pour confirmer son placement.\nLes traits ont une taille minimale.";
                tooltipShortcut = "\nRACCOURCI : " + toggledButtonID + "\n" + "COULEUR : ESPACE";
                break;
            case 6:
                tooltipTitle = "FLECHE";
                tooltipText = "Cliquez pour créer la base d'une flèche et relâchez pour confirmer son placement.\nLes flèches ont une taille minimale.";
                tooltipShortcut = "\nRACCOURCI : " + toggledButtonID + "\n" + "COULEUR : ESPACE";
                break;
            case 7:
                tooltipTitle = "ELLIPSE";
                tooltipText = "Cliquez pour créer la base d'une ellipse et relâchez pour confirmer son placement.\nLes ellipses ont une taille minimale.";
                tooltipShortcut = "\nRACCOURCI : " + toggledButtonID + "\n" + "COULEUR : ESPACE";
                break;
            case 8:
                tooltipTitle = "RECTANGLE";
                tooltipText = "Cliquez pour créer la base d'un rectangle et relâchez pour confirmer son placement.\nLes rectangles ont une taille minimale.";
                tooltipShortcut = "\nRACCOURCI : " + toggledButtonID + "\n" + "COULEUR : ESPACE";
                break;
            case 9:
                tooltipTitle = "EFFACER";
                tooltipText = "Cliquez sur un élément pour l'effacer du terrain.\n Vous pouvez maintenir le clic et effacer plusieurs objets d'un coup.";
                tooltipShortcut = "\nRACCOURCI : " + toggledButtonID;
                break;
            case 10:
                tooltipTitle = "AJOUTER JOUEUR 1";
                tooltipText = "Cliquez sur le terrain pour y créer un joueur de l'équipe Bleue.\nValidez avec ENTREE le nom de votre joueur.\nLe reste de l'application n'est pas accessible durant la saisie.";
                tooltipShortcut = "\nRACCOURCI : " + toggledButtonID;
                break;
            case 11:
                tooltipTitle = "AJOUTER JOUEUR 2";
                tooltipText = "Cliquez sur le terrain pour y créer un joueur de l'équipe Rouge.\nValidez avec ENTREE le nom de votre joueur.\nLe reste de l'application n'est pas accessible durant la saisie.";
                tooltipShortcut = "\nRACCOURCI : " + toggledButtonID;
                break;
            case 12:
                tooltipTitle = "RENOMMER JOUEUR";
                tooltipText = "Cliquez sur un joueur pour le renommer.\nValidez avec ENTREE le nom de votre joueur.\nLe reste de l'application n'est pas accessible durant la saisie.";
                tooltipShortcut = "\nRACCOURCI : " + toggledButtonID;
                break;

        }
    }
}