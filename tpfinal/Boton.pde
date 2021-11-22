class Boton {
  //----Campos----//
  //Dato posición x, y
  int x, y, ancho, alto;
  //Dato tamaño x, y
  //Dato color
  //String para dibujar los textos sobre los botones
  String textoBoton;

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
  void actualizar() {
    dibujar();
  }
  void dibujar() {
    pushStyle();
    rectMode (CENTER);
    textAlign (CENTER, CENTER);
    fill (0);
    rect (x+5, y+5, ancho-10, alto-10, 7);
    textSize (20);
    fill (255);
    text (textoBoton, x, y);
    if (mouseEncima()) {
      fill (0);
      rect (x, y, ancho, alto+5, 7);
      textSize (30);
      fill (255);
      text (textoBoton, x, y-3);
    }
    popStyle();
  } // --> dibuja botones en la pantalla

  void showText(String t, int x){
    pushStyle();
    textAlign(CENTER, CENTER);
    fill (100, 50, 50);
    text(t,x, height/2);
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
/*void resaltar() {
 }
 --> con dondicional si paso el mouse por arriba hace el rect y el texto más grandes
 void mostrarTexto() {
 }
 --> para los botones grandes que ocupan mitad de pantalla, se dibujan cuando paso el mouse por encima
 }*/
