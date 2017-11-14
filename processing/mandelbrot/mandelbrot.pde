float C1 = 0.287;
float C2 = 0.491;


void setup() {

   size(640, 480);
}

void draw() {
  background(0);
  //C1 = map(mouseX, 0, width, -2, 2);
  //C2 = map(mouseY, 0, height, -2, 2);  
  //print(C1); print(" "); println(C2);
  for (int i=0; i<=width; i++) {
    for (int j=0; j<=height; j++) {
      float[] c = pixel2complex(i,j);
      float[] t = c;
       
      for (int n=0; n<50; n++) {
        t = f(t);
        if (amp(t) > 1) {
          stroke(col(n));
          point(i,j);
          break; 
        }
      }
    }
  }
  
}

float[] f(float[] z) {
  return add(mult(z, z), complex(C1,C2));
}


color col(int n) {
  if (n<10)
    return color(n*20);
  else if (n<20)
    return color(200, 300-(n*20), 200);
  else if (n<30)
    return color(200, 100, 400 - (n*20));
  else return color(200 - (n*10), 100, 100);
  
  
}

float[] complex(float x, float y) {
   float[] c = new float[2];
   c[0] = x;
   c[1] = y;
   return c;
}

float amp(float[] z) {
   return sqrt((z[0]*z[0]) + z[1]*z[1]);
}

float[] mult(float[] a, float[] b) {
   float[] c = new float[2];
   c[0] = (a[0]*b[0]) - (a[1]*b[1]);
   c[1] = (a[0]*b[1]) + (a[1]*b[0]);
   return c;
}

float[] add(float[] a, float[] b) {
   float[] c = new float[2];
   c[0] = a[0] + b[0];
   c[1] = a[1] + b[1];
   return c;
}


float[] pixel2complex(int i, int j) {
  float[] c = new float[2];
  c[0] = map(i, 0, width, -1.5, 1.5);
  c[1] = map(j, 0, height, -1.5, 1.5);
  return c;
}

/**

 A+ia * B+ib
 
 A*B + i(A*b + a*B) - (a*b)



*/