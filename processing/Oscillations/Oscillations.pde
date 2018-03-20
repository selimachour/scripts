

Ball center;

Pendulum[] p = new Pendulum[20];

void setup() {
  size(640, 480);
  
  center = new Ball(width/2, 20);
  for (int i=0; i<p.length; i++)
    p[i] = new Pendulum(center, -PI/4, 300 - 10*i);
  
}



void draw() {
  background(0);
  
  center.draw();
  
  for (int i=0; i<p.length; i++)
    p[i].draw();
  
  
  
}