class Boton {
  int x, y, ancho, alto;
  String textoBoton;
  color m = color(67, 53, 92, 10);
  PFont fuenteBotones;
  
  Boton(String textoBoton_, int x_, int y_, int ancho_, int  alto_) {
    //posiciones x, y por parámetro
    fuenteBotones = loadFont ("SpongeBob.vlw");
    x = x_;
    y = y_;
    ancho = ancho_;
    alto = alto_;  
    textoBoton = textoBoton_;
  }
  //-----Métodos-----//
  //  void actualizar() {
  //    dibujar();
  //  }
  void dibujar(color r, color t) {
    pushStyle();
    textFont(fuenteBotones);
    rectMode (CENTER);
    textAlign (CENTER, CENTER);
    stroke(#E1EA7B);
    fill (r);
    rect (x+5, y+5, ancho-10, alto-10, 7);
    textSize (25);
    fill (t);
    text (textoBoton, x+5, y+5);
    if (mouseEncima()) {
      fill (r);
      rect (x, y, ancho, alto+5, 7);
      textSize (35);
      fill (t);
      text (textoBoton, x, y-3);
    }
    popStyle();
  } // --> dibuja botones en la pantalla

  void dibujarBotMitad() {
    fill(m);
    noStroke();
    rect(x, y, ancho, alto);
    textSize(30);
    textFont(fuenteBotones);
    textAlign(CENTER, CENTER);
    fill(100, 50, 50);
    text(textoBoton, x+ancho/2, height/2);
  }

  boolean mouseEncima() {
    if (mouseX > x-ancho/2 && mouseX < x+ancho/2 && mouseY > y-alto/2 && mouseY < y+alto/2 ) {
      return true;
    } else { 
      return false;
    }
  }
}
