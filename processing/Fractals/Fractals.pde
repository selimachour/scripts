
void setup() {
  size(640, 480);
  
  
}

color n2color(int n) {
  if (n < 10) {
    return color(255, n*25, 0); 
  } else if (n < 20) {
    return color(255, 255, (n-10)*25);
  } else if (n < 30) {
    return color((n-20) * 10, 255, 255);
  } else {
    return color(n *6); 
  }
  
  
}


Complex z;

void f(Complex z, float x, float y) {
  float xx = (z.x*z.x) - (z.y*z.y) + x;
  float yy = 2 * z.x * z.y + y;
  z.x = xx;
  z.y = yy;
}


void draw() {
  background(0);
  translate(width/2, height/2);
  scale(1, -1);

  for (float x = -1; x <= 1; x+=0.005) {
    for (float y = -1; y <= 1; y+=0.005) {
      z = new Complex(x, y);

      Complex t = new Complex(x, y);
      
      int n = 0;
      while(t.amp() < 1) {
        f(t, map(mouseX, 0, width, -1, 1), map(mouseY, 0, height, -1, 1));
        n++;
        if (n>50)
          break;
      }
      

      z.draw(n2color(n));
    }
  }
        println(map(mouseX, 0, width, -1, 1));
      println(map(mouseY, 0, height, -1, 1));
}