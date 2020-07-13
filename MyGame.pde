

//
import java.util.Hashtable;

// interface utilisateur
GUI gui = null; 

//
CommandProcessor cp = null;

// lecture des parammètres d'entrée
public void settings() {
  fullScreen();
  smooth(4);
}

// application des paramètres d'entrée
public void setup() {
  // Initialisation de l'application
  frameRate(20);
  colorMode(RGB);
  noFill();
  //
  cp = new CommandProcessor();
  
  // création 
  createGUI();
}

// mise à jour graphismes
public void draw() {
  //
  background(0, 0, 0);
  //
  tickGUI();

}
