class Dialogo {
  //-------Campos------//
  PFont fuente;
  String[] dialogos;
  int indiceDeTexto;
  /*Dato posición x, y (para el texto)
   Dato posición xCuadro, yCuadro (para el rect detrás del texto)
   Dato color del texto
   Dato tamaño del texto
   Dato color del rect*/

  //-----Constructor-----//
  Dialogo() {
    //carga de dialogos
    fuente = loadFont ("fuente.vlw");
    dialogos = loadStrings("data/texto/dialogos.txt");
    indiceDeTexto = 0;
    //Posiciones x, y
    //Posición xCuadro, yCuadro
    //Color del rect
  }



  //------Métodos-----//
  void dibujar(int x, int y, int ancho, int alto) {
    println("indice " + indiceDeTexto);
    stroke(#E1EA7B);
    fill(#DCED6E, 100);
    if (indiceDeTexto!= 0) {
      rect(x, y, ancho, alto);
    }

    textFont(fuente);
    textSize(30);
    fill(100, 20, 250);
    textAlign(CENTER, CENTER);
    text(dialogos[indiceDeTexto], ancho/2, y+alto/2);
  } //--> dibuja el texto y la barra del fondo para que se visualice

  void getIndice(int _indice) {
    indiceDeTexto = _indice;
    //dibujar(0, 500, width-1, 100);
  }

  int getIndice() {
    return indiceDeTexto;
  }

  /* void pasarDialogo() {
   if (indiceDeTexto < dialogos.length-1) {
   indiceDeTexto++;
   } else {
   indiceDeTexto = 0;
   }
   }*/  ///-->crece el índice, pasa el dialogo con condición
}
