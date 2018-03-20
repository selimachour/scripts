

int paletteX = 20, 
  paletteY = 20, 
  paletteW = 100, 
  paletteH = 200;

void setup() {
  size(640, 480); 

  dessinePalette(paletteX, paletteY, paletteW, paletteH);
}

float epaisseur = 12;
int[] a = new int[6];

color couleurCourante;

color[] palette = {
  color(0), 
  color(255), 
  color(255, 0, 0), 
  color(0, 255, 0), 
  color(125), 
  color(0, 0, 255), 
  color(255, 0, 255), 
  color(255, 255, 0), 
};



void draw() {
  if (mousePressed) {
    strokeWeight(epaisseur);
    stroke(couleurCourante);
    line(pmouseX, pmouseY, mouseX, mouseY);
    dessinePalette(paletteX, paletteY, paletteW, paletteH);
  }
}


void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e == -1) {
    epaisseur++;
  } else if (e == 1 && epaisseur > 1) {
    epaisseur--;
  }
}

void mouseClicked() {
  // a-t-on cliqué dans la palette ?
  if (mouseX > paletteX && mouseX < (paletteX + paletteW) && mouseY > paletteY && mouseY < (paletteY + paletteH)) {
    // quelle hauteur depuis le haut de la palette ?
    int y = mouseY - paletteY;
    int hauteurCouleur = paletteH / palette.length;
    int carreClique = y / hauteurCouleur;

    if (carreClique >= palette.length)
      carreClique = palette.length - 1;  

    couleurCourante = palette[carreClique];

  }
}

/**
 * Ceci dessine une palette ...
 * ...
 */
void dessinePalette(int x, int y, int w, int h) {
  strokeWeight(1);
  stroke(0);
  for (int i=0; i<palette.length; i++) {
    fill(palette[i]);
    rect(x, y + i*h/palette.length, w, h/palette.length);
  }
}