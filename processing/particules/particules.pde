


Particule particules[];
int count = 120;

void setup() {
  //size(800, 600);
  fullScreen();
  particules = new Particule[count];
  for (int i = 0; i<count; i++) {
    particules[i] = new Particule();
  }
}


void draw() {
  background(4,52,111);
  
  for (Particule p : particules) {
    p.update();
    p.draw();
    p.accel = 1;
  }
  
  for (int i = 0; i<count; i++) {
    for (int j = i+1; j<count; j++) {
       
      float d = dist(particules[i].x, particules[i].y, particules[j].x, particules[j].y);
      if (d < 80) {
        strokeWeight(0.5);
        stroke(255,255,255,180);
        line(particules[i].x, particules[i].y, particules[j].x, particules[j].y);
        
        particules[i].accel+=0.5;
        particules[j].accel+=0.5;
      }
         
    }
  }
}