/**
 * Text Input
 */
class TextInput {

  //
  int x, y, w, h;
  String txt = "";

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
      } else if (keyCode == TAB) {
        completeInput();
      }
    } 
    // caractères
    else if ((keyCode == BACKSPACE)&&(txt.length()>0)) {
      txt=txt.substring(0, txt.length()-1);
    } else if ((keyCode == ENTER) ||(keyCode == RETURN)) {
      applyInput();
      txt="";
    } else if ((characters.contains(""+key))&&(textWidth(txt+key)<w-10)) {
      txt=txt+key;
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
    text(txt, x+5, y);
  }

  // appliquer comportement appui sur Tabulation
  public void completeInput() { 
    println("TAB");
  }

  // appliquer comportement appui sur un caractère
  public void verifyInput() { 
    println("VERIFY "+txt);
  }

  // appliquer comportement appui sur Entrée
  public void applyInput() { 
    println("APPLY "+txt);
  }
}
