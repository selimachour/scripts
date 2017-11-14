  

class Particule {
   
  float x;
  float y;
  float dx;
  float dy;
  float accel = 1;
  
  Particule() {
    x = random(width);
    y = random(height);

    dx = random(-0.3, 0.3);
    dy = random(-0.3, 0.3);
  }
  
  void update() {
    x += dx * accel;
    y += dy * accel;
    
    if (x<0) x+= width;
    if (y<0) y+= height;
    if (x>width) x-=width;
    if (y>height) y-= height;
  }
  
  void draw() {
    strokeWeight(1);

    stroke(255,255,255);
    ellipse(x, y, 1, 1);

    fill(255,255,255, 20);
    noStroke();
    ellipse(x, y, accel*5, accel*5);
  }
}