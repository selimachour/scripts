class Complex {
  
  float x;
  float y;
  float zoom = 200;
  
  Complex(float _x, float _y) {
    x = _x;
    y = _y;
  }
  
  void draw(color c) {
    stroke(c);
    point(x*zoom, y*zoom);
  }
  
  float amp() {
    return sqrt(x*x + y*y); 
  }
  
}