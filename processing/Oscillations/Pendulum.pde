


class Pendulum {
  
  float angle;
  float len;
  Ball center;
  float time;
  
  Pendulum(Ball c, float a, float l) {
    angle = a;
    len = l;
    center = c;
    time = 0;
  }
  
  void draw() {
    time = time + 10;
    angle = sin(time/len);
    
    
    // calcul de position a l'instant t
    float x = center.x + (sin(angle) * len);
    float y = center.y + (cos(angle) * len);
    stroke(255);
    line(center.x, center.y, x, y);
    ellipse(x, y, 10, 10);
  }
}