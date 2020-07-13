/** 
 * paramètrage et données de l'interface graphique de la fenètre principale
 */
class GUI { 

  // l'interface graphique est-il représenté
  boolean guiShown = true;

  //
  int fontSize = 32;
  PFont defaultFont = null;

  // pour les animations
  long tick = 0;

  // main text input field
  GTextField input = null;

  //
  GLabel[] outputs = null;

  // taille de entrées / sorties textes
  int xInput = width/2-width/6;
  int yInput = height-3*fontSize-10;
  int wInput = width/3;
  int hInput = fontSize+10;

  //
  int nbInput = (int)(1.0*(yInput-2*hInput)/hInput);
}

/**
 * Create all gui elements
 */
void createGUI() {

  //
  gui = new GUI();

  // Fontes par défaut ?
  gui.defaultFont = createFont("Times New Roman", gui.fontSize);
  textFont(gui.defaultFont);
  G4P.setInputFont("Times New Roman", G4P.PLAIN, gui.fontSize); 
  G4P.setDisplayFont("Times New Roman", G4P.PLAIN, gui.fontSize); 
  G4P.setGlobalColorScheme(G4P.BLUE_SCHEME);
  //
  gui.input = new GTextFieldExt(this, gui.xInput, gui.yInput, gui.wInput, gui.hInput);
  gui.input.setPromptText("Input your commands!");
  gui.input.setOpaque(true);
  gui.input.setText("");

  //
  gui.outputs = new GLabel[gui.nbInput];
  for (int i=1; i<gui.nbInput; i++) {
    gui.outputs[i-1] = new GLabel(this, gui.xInput, gui.yInput-(i+1)*gui.hInput, gui.wInput, gui.hInput);
    gui.outputs[i-1].setText("--");
  }
}

// remanence
void tickGUI() {
  //
  gui.tick += 1;
  //
  fill(100, 100, 100);
  stroke(0, 0, 0);
  String txt = "MyGame (c) StM 2020 - version "+_version_;
  textAlign(LEFT);
  textFont(gui.defaultFont);
  textSize(gui.fontSize);
  text(txt, width-textWidth(txt)-10, height-10-gui.fontSize);
  //
  textSize(gui.fontSize);
  textAlign(LEFT);
  txt = day()+"/"+month()+"/"+year()+" - "+hour()+":"+minute()+":"+second();
  text(txt, width-textWidth(txt)-10, height-10);
  //
  noFill();
  stroke(255, 255, 255, 50);
  for (int i=1; i<gui.nbInput; i++) {
    rect(gui.xInput, gui.yInput-(i+1)*gui.hInput, gui.wInput, gui.hInput);
  }
  //
  gui.input.setFocus(true);
}
