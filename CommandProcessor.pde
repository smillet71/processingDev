/**
 */
public class GTextFieldExt extends GTextField {
  
  //
  public GTextFieldExt(PApplet p, float x, float y, float w, float h) {
    super(p, x, y, w, h); 
  }
  
  //
  void keyEvent (KeyEvent e) {
    super.keyEvent(e); 
    if (keyCode == TAB) {
       println("TAB"); 
    }
  }
  
}

//
public void processInputTab(String text) { 
  println("TAB");
}

//
public void processInputEnter(String text) { 
  println("ENTER "+text);
}

//
public void handleTextEvents(GEditableTextControl textControl, GEvent event) { 
  if (event == GEvent.CHANGED) {
    println("CHANGED: "+textControl.getText());
  } else if (event== GEvent.ENTERED) {
    processInputEnter("ENTERED: "+textControl.getText());
    textControl.setText("");
  } else  {
    println("ELSE: "+event.getDesc());
  }
}
