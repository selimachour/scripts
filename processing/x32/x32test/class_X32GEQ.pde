
class X32FxDualGEQ extends X32Fx {
  
  private final int barHeight  = 40;
  private final int barWidth   = 6;
  private final int barSpacing = 2;
  
  
  X32FxDualGEQ(X32 console, int _slot, int x, int y) {
    super(console, _slot, x, y);
  }
  

  void display(int x, int y) {
    
    for (int i=1; i<=64; i++) { 
      
      if (i == 33) {
        y += barHeight + 10;
        x -= 32 * ((barSpacing + barWidth));
      }
      
      String oscAddr = "/fx/" + slot + "/par/" + pad(""+i);
      Slider s = x32.cp5.addSlider(oscAddr)
         .setPosition(x + (i* (barSpacing + barWidth)), y)
         .setSize(barWidth, barHeight)
         .setRange(0, 1)
         .setLabelVisible(false)
         .setValue(0.5)
         .setUpdate(true)
         .onChange(new CallbackListener() {
            public void controlEvent(CallbackEvent theEvent) {
              Controller c = theEvent.getController();
              OscMessage myMessage = new OscMessage(c.getLabel());
              myMessage.add(c.getValue());
              oscP5.send(myMessage); 
            }
          });

      if ((i % 32) == 0) {
        s.setColorActive(color(200));    
        s.setColorForeground(color(138));    
        s.setColorBackground(color(40));    
      }   
      
      x32.bindParam(oscAddr, s);
      OscMessage myMessage = new OscMessage(oscAddr);
      oscP5.send(myMessage); 

    }  
  }
}


class X32FxStereoGEQ extends X32Fx {
  
  private final int barHeight  = 80;
  private final int barWidth   = 6;
  private final int barSpacing = 2;
  
  
  X32FxStereoGEQ(X32 console, int _slot, int x, int y) {
    super(console, _slot, x, y);
  }
  
  void display(int x, int y) {
    
    String[] frequencies = {"", "20", "25", "31.5", "40", "50", "63", "80", "100", "125", "160", "200", "250", "315", "400", "500", "630", "800", "1k", "1k25", "1k6", "2k", "2k5", "3k15", "4k", "5k", "6k3", "8k", "10k", "12k5", "16k", "20k", "M"};
    String[] freqs = {"", "20", "", "31.5", "40", "50", "63", "80", "100", "125", "", "", "250", "", "", "500", "", "", "1k", "", "1k6", "2k", "2k5", "3k15", "4k", "5k", "6k3", "8k", "10k", "12k5", "16k", "20k", "M"};
    
    for (int i=1; i<=32; i++) { 
      
      //
      String oscAddr = "/fx/" + slot + "/par/" + pad(""+i);
      Slider s = x32.cp5.addSlider(oscAddr)
         .setPosition(x + (i* (barSpacing + barWidth)), y)
         .setSize(barWidth, barHeight)
         .setRange(0, 1)
         .setLabelVisible(false)
         .setValue(0.5)
         .onChange(new CallbackListener() {
            public void controlEvent(CallbackEvent theEvent) {
              Controller c = theEvent.getController();
              OscMessage myMessage = new OscMessage(c.getLabel());
              myMessage.add(c.getValue());
              oscP5.send(myMessage); 
            }
          });
      if (i == 32) {
        s.setColorActive(color(200));    
        s.setColorForeground(color(138));    
        s.setColorBackground(color(40));    
      }   
      // freq labels
      x32.cp5.addTextlabel("label_" + oscAddr)
          .setText(freqs[i])
          .setPosition(x + (i* (barSpacing + barWidth)), y + barHeight)
          //.setColorValue(0xffffff00)
          //.setFont(createFont("Georgia",20))
         ;

      x32.bindParam(oscAddr, s);    
      OscMessage myMessage = new OscMessage(oscAddr);
      oscP5.send(myMessage); 
    }  
    
  }
}

