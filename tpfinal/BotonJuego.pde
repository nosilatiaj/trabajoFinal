class BotonJuego {
  int x, y, ancho, alto;
  String textoBoton;

  BotonJuego(String textoBoton_, int x_, int y_, int ancho_, int alto_) {
    textoBoton = textoBoton_;
    x = x_;
    y = y_;
    ancho = ancho_;
    alto = alto_;
  }

  void actualizar() {
    dibujar();
  }

  void dibujar() {
    pushStyle();
    rectMode(CENTER);
    textAlign(CENTER,CENTER);
    fill(0);
    rect(x+5, y+5, ancho-10, alto-10, 7);
    textSize(20);
    fill(255);
    text(textoBoton, x, y);
    if (mouseEncima()) {
      fill(0);
      rect(x, y, ancho, alto+5, 7);
      textSize(30);
      fill(255);
      text(textoBoton, x, y-3);
    }
    popStyle();
  }

  boolean mouseEncima() {
    if (mouseX > x-ancho/2 && mouseX < x+ancho/2 && mouseY > y-alto/2 && mouseY < y+alto/2 ) {
      return true;
    } else { 
      return false;
    }
  }
}
