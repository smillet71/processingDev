

//
import java.util.Hashtable;
import java.util.Vector;
import java.util.Set;

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
  frameRate(30);
  colorMode(RGB);
  noFill();
  
  //
  cp = new CommandProcessor();
  cp.addCommand(tokensTestCommand1);
  cp.addCommand(tokensTestCommand2);
  cp.addCommand(tokensTestCommand3);
  cp.addCommand(tokensTestCommand1);
  
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
