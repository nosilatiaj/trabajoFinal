class Boton {
  //----Campos----//
  //Dato posición x, y
  int x, y, ancho, alto;
  //Dato tamaño x, y
  //Dato color
  //String para dibujar los textos sobre los botones
  String textoBoton;
  color m = color(67, 53, 92, 30);

  //-----Constructor-----//
  Boton(String textoBoton_, int x_, int y_, int ancho_, int  alto_) {
    //posiciones x, y por parámetro
    x = x_;
    y = y_;
    //tamaño por parámetro
    ancho = ancho_;
    alto = alto_;  
    //textoBotones="";
    textoBoton = textoBoton_;
  }
  //-----Métodos-----//
  //  void actualizar() {
  //    dibujar();
  //  }
  void dibujar(color r, color t) {
    pushStyle();
    rectMode (CENTER);
    textAlign (CENTER, CENTER);
    fill (r);
    rect (x+5, y+5, ancho-10, alto-10, 7);
    textSize (20);
    fill (t);
    text (textoBoton, x, y);
    if (mouseEncima()) {
      fill (r);
      rect (x, y, ancho, alto+5, 7);
      textSize (30);
      fill (t);
      text (textoBoton, x, y-3);
    }
    popStyle();
  } // --> dibuja botones en la pantalla

  void dibujarBotMitad() {
      fill(m);
      noStroke();
      rect(x, y, ancho, alto);
      textAlign(CENTER,CENTER);
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
/*void resaltar() {
 }
 --> con dondicional si paso el mouse por arriba hace el rect y el texto más grandes
 void mostrarTexto() {
 }
 --> para los botones grandes que ocupan mitad de pantalla, se dibujan cuando paso el mouse por encima
 }*/
