class Tiempo {
  int tiempoInicio;
  int tiempoCant;
  int time;
  boolean tiempoFinalizado; //para no tener que llamar a juego se crea boolean para comprobar que finalizo el tiempo 

  Tiempo (int tCant) {
    tiempoInicio = millis();
    tiempoCant = tCant*1000;
    tiempoFinalizado = false;
    
    
  }

  void start() {
    
      time = (tiempoInicio + tiempoCant) - millis(); //contador hacia abajo
      if (time>=0) { //dibuja el reloj
        fill(#F7EC02);
        rect(300, 13, 100, 30, 7);
        fill(0);
        textSize(20);
        textAlign(CENTER);
        text(time/1000, 350, 35);
      } else if (time<1) { //setea el tiempo finalizado 
        tiempoFinalizado = true; 
      }
  }

  void reiniciar() {
    tiempoInicio = millis(); //reinicia reloj con el tiempo actual - por un bug que cuando iniciabas el juego ya estaba empezado
    tiempoFinalizado = false; //reinicia el tiempo finalizado falso porque sino se rompe (si esto no esta al reiniciar el juego luego de jugar, se pierde automaticamente)
   
  }
  
}
