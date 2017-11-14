
class X32 {

  private HashMap<String,  Controller> params = new HashMap<String, Controller>();
  private HashMap<Integer, Controller> fx     = new HashMap<Integer, Controller>();
  private HashMap<Integer, X32Fx>      fxs    = new HashMap<Integer, X32Fx>();
  private ControlP5  cp5;
  
  X32(ControlP5 _cp5) {
    cp5 = _cp5;
  }
  
  public void draw() {
  }
  
  
  public void setFx(int slot, String fxName, int x, int y) {
     if ("DualGEQ" == fxName) {
         X32FxDualGEQ f = new X32FxDualGEQ(this, slot, x, y);
         fxs.put(slot, f);
     } else if ("StereoGEQ" == fxName) {
         X32FxStereoGEQ f = new X32FxStereoGEQ(this, slot, x, y);
         fxs.put(slot, f);
     }
  }
  
  public void updateAll() {
    for (Map.Entry me : params.entrySet()) {
    }
  }
  
  public void onreceive(OscMessage m) {
    String param = m.addrPattern();
    for (Map.Entry me : params.entrySet()) {
      if (param.equals(me.getKey())) {
        Controller c = params.get(me.getKey());
        c.setValue(m.get(0).floatValue());
        println("setting: " + param + " " + m.get(0).floatValue());
      }
    }
  }
  
  protected void bindParam(String oscAddr, Controller c) {
    params.put(oscAddr, c);
  }
}


