import processing.pdf.*;
PFont myfont;

void setup() {
  size(595, 879, PDF, "multiplepages.pdf");  
  myfont = createFont("B.S.-Mono-Regular.otf", 10);
  textFont(myfont);
  frameRate(2);
  smooth(8);
}

void draw() {
  background(255);

  float margenLateral = 80;
  float margenVertical = margenLateral / 2;

  float zonaIzquierda = margenLateral;
  float zonaDerecha = width - margenLateral;
  float zonaSuperior = margenVertical;
  float zonaInferior = height - margenVertical;

  float origenX = zonaIzquierda;
  float origenY = (zonaSuperior + zonaInferior) / 2;

  for (int i = 0; i < 30; i++) {
    float x = origenX;
    float y = origenY + random(-150, 150);
    float angle = radians(random(-10, 10));
    dibujarHilo(x, y, angle, zonaIzquierda, zonaDerecha, zonaSuperior, zonaInferior);
  } // <-- cierre del for

  PGraphicsPDF pdf = (PGraphicsPDF) g;  // Get the renderer
  if (frameCount == 10) {
    exit();
  } else {
    pdf.nextPage();  // Tell it to go to the next page
  }
} // <-- cierre de draw()

void dibujarHilo(float x, float y, float angleInicial, float zonaIzquierda, float zonaDerecha, float zonaSuperior, float zonaInferior) {
  String palabra = "bla";
  float angle = angleInicial;

  for (int i = 0; i < 120; i++) {
    fill(0);
    textSize(10);

    float jitterX = random(-3, 3);
    float jitterY = random(-3, 3);

    if (y < zonaSuperior || y > zonaInferior) break;
    if (x < zonaIzquierda || x > zonaDerecha) break;

    pushMatrix();
    translate(x + jitterX, y + jitterY);
    rotate(angle);
    text(palabra, 0, 0);
    popMatrix();

    float avance = textWidth(palabra) * random(1.3, 1.7);
    x += cos(angle) * avance;
    y += sin(angle) * avance;
    angle += random(-0.07, 0.07);
  }
}
