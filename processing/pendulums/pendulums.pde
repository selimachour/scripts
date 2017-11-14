
int OX = 320;
int OY = 20;

class Pendulum {
  float ray;
  float disk;
  float speed;
  float range;
  float angle;
  float pos;
  
  Pendulum(float _ray, float _disk, float _speed, float _range) {
    ray = _ray;
    disk = _disk;
    speed = _speed;
    range = _range;
    pos = 0;
  }
  
  void draw() {
    pos += speed;
    angle = sin(pos) * range;
    
    float x = cos(angle) * ray;
    float y = sin(angle) * ray;
    
    ellipseMode(RADIUS);
    stroke(80);
    line(OX, OY, OX + y, OY + x);
    ellipse(OX + y, OY + x, disk, disk);
  }
}

int n = 30;
Pendulum[] p;

void setup() {
  size(640, 480);
  p = new Pendulum[n];
  for (int i=0; i<n; i++)
    p[i] = new Pendulum(100 + i*10, 5, 0.09 - ((float)i/1000), 0.5);
}



void draw() {
  background(0);
  for (int i=0; i<n; i++)
    p[i].draw();
  
  
}