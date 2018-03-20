

class Ball {
  float x;
  float y;
  
  Ball(float _x, float _y) {
    println(_x);
    x = _x;
    y = _y;
  }
  
  void draw() {
    ellipseMode(CENTER);
    ellipse(x, y, 10, 10);
  }
}