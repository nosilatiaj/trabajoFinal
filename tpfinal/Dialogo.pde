class Dialogo {
 
  PFont fuente;
  String[] dialogos;
  int indiceDeTexto;
  
  Dialogo() {
    //carga de dialogos
    fuente = loadFont ("fuente.vlw");
    dialogos = loadStrings("data/texto/dialogos.txt");
    indiceDeTexto = 0;
   
  }

 void dibujar() {
    stroke(#E1EA7B);
    fill(#DCED6E, 100);
    rect(0, 500, width-1, 100);
    textFont(fuente);
    textSize(30);
    fill(100, 20, 250);
    textAlign(CENTER, CENTER);
    text(dialogos[indiceDeTexto], width/2, 550);
  }

  void getIndice(int _indice) { //set indice 
    indiceDeTexto = _indice;
    //dibujar(0, 500, width-1, 100);
  }

  int getIndice() {
    return indiceDeTexto;
  }

  
}
