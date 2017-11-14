
int ms;
int w = 20;
int h = 20;
int r = 20;


void setup() {
  size(1200, 700);
  
  ms = millis();
}

void draw() {
  background(255);
  int   deltaMs = millis() - ms;
  float angle   = (deltaMs * TWO_PI / 1000);
  
  int   centerX, centerY;
  float a;
  
  for (int i = -20; i<30; i++) {
    for (int j = -14; j<14; j++) {
      // center of circle
      centerX = 340 + (i * w);
      centerY = 240 + (j * h);
      // angle
      a = angle + (i* 0.1);
      dot(centerX + (cos(a) * r), centerY + (sin(a) * r));
    }
  }
}

void dot(float x, float y) {
  fill(0);
  
  arc(x, y, 2, 2, 0, TWO_PI);
}
