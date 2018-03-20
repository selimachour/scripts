


void setup() {
  size(640, 480);
}

float x = 100;
float y = 100;

float vx = 2;
float vy = 6;

float raquetteLift = 10;
float raquetteWidth = 100;
float raquetteHeight = 15;
float raquetteX = 200;
float raquetteVitesse = 0;

boolean gameOver = false;

void draw() {
  if (gameOver) {
    background(255, 0, 0);
    return;
  }
  
  background(0);
  

  raquetteX = raquetteX + raquetteVitesse;
  rect(raquetteX, height - raquetteLift - raquetteHeight, raquetteWidth, raquetteHeight);

  checkCollision();
  
  checkBoundaries();
  ellipse(x, y, 10, 10);

  x = x + vx;
  y = y + vy;
}


void checkCollision() {
  if (y < (height - raquetteLift - raquetteHeight)) {
     // c'est bon, la balle est loin
     return;
  }
  
  if (x > raquetteX && (x < raquetteX + raquetteWidth)) {
    vy = -vy;
    return;
  }
  
  gameOver = true;
}

void keyPressed() {
  if (keyCode == LEFT)
    raquetteVitesse = -10;
  else if (keyCode == RIGHT)
    raquetteVitesse = 10;
    
}

void keyReleased() {
  raquetteVitesse = 0;
}


void checkBoundaries() {
  
  if (x < 0) {
    vx = -vx;
    x = -x;
  } else if (x > width) {
    vx = - vx;
    x = (2 * width) - x;
  }
  if (y < 0) {
    vy = -vy;
    y = -y;
  } else if (y > height) {
    vy = - vy;
    y = (2 * height) - y;
  }
  
}