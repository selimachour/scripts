


class Point {
  
  float x, y;
  
  Point(float xx, float yy) {
    x = xx;
    y = yy;
  }
  
  Point middle(Point b) {
    return new Point( (x + b.x) / 2, (y + b.y) / 2); 
  }
  
  void draw() {
    point(x, y); 
  }
}

Point summets[] = new Point[3];
Point a;

void setup() {
  size(640, 480);

  summets[0] = new Point(320, 10);
  summets[1] = new Point(10, 460);
  summets[2] = new Point(630,460);

  background(0);
  strokeWeight(2);
  stroke(255);
  summets[0].draw();
  summets[1].draw();
  summets[2].draw();
  
  strokeWeight(1);

  a = new Point(150, 230);
  frameRate(1);
}


int v;

void draw() {

  for (int i=0; i<1; i++) {
    a.draw();
  
    v = (int)random(0, 3);
    a = a.middle(summets[v]);
  }

}