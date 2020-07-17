/**
 * Text Input
 */
class TextInput {

  //
  int x, y, w, h;
  String intxt = "";

  //
  String characters=" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";

  //
  public TextInput(int x, int y, int w, int h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  //
  public void update() {
    // 
    if (key==CODED) {
      if (keyCode == UP) {
        println("UP");
      } else if (keyCode == DOWN) {
        println("DOWN");
      }
    } 
    //
    else if (keyCode == TAB) {
      completeInput();
    }    
    // caractères
    else if ((keyCode == BACKSPACE)&&(intxt.length()>0)) {
      intxt=intxt.substring(0, intxt.length()-1);
    } else if ((keyCode == ENTER) ||(keyCode == RETURN)) {
      applyInput();
      intxt="";
    } else if ((characters.contains(""+key))&&(textWidth(intxt+key)<w-10)) {
      intxt=intxt+key;
      // Ménage
      if ((intxt.length()>0)&& (intxt.charAt(0) == ' ')) intxt=intxt.substring(1,intxt.length());
      intxt = intxt.replace("  "," ");
      //
      verifyInput();
    }
  }

  //
  public void draw() {
    //
    noFill();
    strokeWeight(2);
    stroke(255, 255, 255, 100);
    rectMode(CORNER);
    rect(x, y, w, h);
    //
    textAlign(LEFT, TOP);
    text(intxt, x+5, y);
  }

  // appliquer comportement appui sur Tabulation
  public void completeInput() { 
    println("TAB");
  }

  // appliquer comportement appui sur un caractère
  public void verifyInput() { 
    Set<String> firstWords = cp.commandList.keySet();
    boolean found = false;
    for (String kword : firstWords) {
      if (intxt.startsWith(kword.substring(0, intxt.length()-1))) {
        found = true;
        break;
      }
    }
    println("VERIFY "+intxt+" "+found);
  }

  // appliquer comportement appui sur Entrée
  public void applyInput() { 
    println("APPLY "+intxt);
  }
}
