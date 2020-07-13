import g4p_controls.*;

// version 
String _version_= "0.0.1";

//
GUI gui = null; 

//
public void settings() {
  fullScreen();
  smooth(4);
}

public void setup() {
  // Initialisation de l'application
  frameRate(10);
  colorMode(RGB);
  noFill();
  // création 
  createGUI();
}

public void draw() {
  //
  background(0, 0, 0);
  //
  tickGUI();

}
