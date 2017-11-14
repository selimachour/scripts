
class X32Fx {

  int        slot;
  X32        x32;

  void display(int x, int y) {
  }

  void draw() {
    ellipse(10, 10, 30, 30); 
  }
 
  X32Fx(X32 _x32, int _slot, int x, int y) {
    slot = _slot;
    x32  = _x32;
    display(x, y);
  }
}

