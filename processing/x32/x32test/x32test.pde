
import controlP5.*;
import oscP5.*;
import netP5.*;
import java.util.Map;
 
ControlP5  cp5;
OscP5      oscP5;
NetAddress X32address;
X32        x32;


void setup() {
  size(320,450);
  frameRate(25);


  // Create oscP5 object
  OscProperties properties = new OscProperties();
  properties.setRemoteAddress("169.254.11.172", 10023);
  properties.setListeningPort(10023);
  properties.setSRSP(OscProperties.ON);
  oscP5 = new OscP5(this, properties);

  
  cp5 = new ControlP5(this);
  x32 = new X32(cp5);
  x32.setFx(5, "DualGEQ",   20,  20);
  x32.setFx(6, "DualGEQ",   20, 130);
  x32.setFx(7, "DualGEQ",   20, 240);
  x32.setFx(8, "StereoGEQ", 20, 350);
  x32.updateAll();
  

}

int lastMillis = -90000;
int xremoteInterval = 9000;

void draw() {
  background(0);
  if (millis() - lastMillis > xremoteInterval) {
    OscMessage xremote = new OscMessage("/xremote");
    oscP5.send(xremote);
    println("sent: /xremote");
    lastMillis = millis();
  }
}


String pad(String s) {
  if (s.length() == 1)
    s = "0" + s;
  return s;
}

void __controlEvent( ControlEvent theEvent ) {
  print(theEvent.getLabel() + " : ");
  print(theEvent.getValue());
  println();

}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("received: "+theOscMessage.addrPattern());
  println(" "+theOscMessage.typetag());
  x32.onreceive(theOscMessage); 
//  OscArgument oa = theOscMessage.get(0);
//  print(" value: "+oa.floatValue());
  
}