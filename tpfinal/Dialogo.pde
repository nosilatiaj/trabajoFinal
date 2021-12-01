class Dialogo {
  //-------Campos------//
  PFont SpongeBob;
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
    SpongeBob = loadFont ("SpongeBob.vlw");
    dialogos = loadStrings("data/texto/dialogos.txt");
    indiceDeTexto = 0;
    //Posiciones x, y 
    //Posición xCuadro, yCuadro 
    //Color del rect
  }

  //------Métodos-----//
  void dibujar() {
    println("indice " + indiceDeTexto);
    
    text(dialogos[indiceDeTexto], width/2, height/2);
  } //--> dibuja el texto y la barra del fondo para que se visualice
  /* void pasarDialogo(int _pantalla) {
   if (indiceDeTexto < dialogos.length-1) {
   indiceDeTexto++;
   } else {
   indiceDeTexto = 0;
   }
   }*/  //-->crece el índice, pasa el dialogo con condición
}
