class Juego {
  PImage inicio, ganar, perder;
  int pantalla, contador;
  int cantBasura = 35;
  int cantMonedas = 15;
  color cInicio = color (#F7EC02);
  color cGanar = color (0, 255, 0);
  color cPerder = color (255, 0, 0);
  Tiempo tiempo; //en vez de declarar el objeto en tp5 lo hacemos adentro de Juego
  Moneda moneda;
  BotonJuego botonInicio, botonVolver, botonSeguir;
  Basura[] basura = new Basura [cantBasura];
  Moneda[] monedasOriginales = new Moneda [cantMonedas];
  Moneda[] monedasFalsas = new Moneda [cantMonedas];
  int camino;
  boolean jugando;

  Juego () {
    botonInicio = new BotonJuego ("Iniciar", width/2, 530, 170, 90);
    botonVolver = new BotonJuego ("Volver", 200, 530, 170, 90);
    botonSeguir = new BotonJuego ("Seguir", 500, 530, 170, 90);
    moneda = new Moneda();
    tiempo = new Tiempo(11);
    for (int i=0; i<basura.length; i++) {
      basura[i] = new Basura ();
    }
    for (int i=0; i<monedasOriginales.length; i++) {
      monedasOriginales[i] = new Moneda();
      monedasFalsas[i] = new Moneda();
    }
    inicio=loadImage("juego\\img0.jpg");
    ganar=loadImage("juego\\img2.jpg");
    perder=loadImage("juego\\img1.jpg");
    jugando = false;
    camino = 0;
  }

  void dibujarJuego() {

    if (pantalla == 1) {
      tiempo.start(); //inicia el reloj en la pantalla 1

      if (tiempo.tiempoFinalizado) { //si es verdadero perdiste y vas a pantalla 3. 
        pantalla = 3;
      }

      for (int i=0; i<basura.length; i++) {
        basura[i].dibujar();
      }

      //for anidado monedafalsa (j) no era necesario con un for se peude crear moneerroi
      for (int i=0; i<monedasOriginales.length; i++) {
        monedasOriginales[i].dibujarOriginales();
        monedasFalsas[i].dibujarFalsas();
      }
    }
    fill(cInicio);
    rect(480, 13, 200, 30, 7);
    textSize(20);
    fill(0);
    text("Monedas  " + contador + "  /50", 580, 35);
    dibujarPantalla();
    actualizarPantalla();
  }


  void cambiarAPantalla(int _pantalla) {
    pantalla = _pantalla;
  }

  int getPantalla() {
    return pantalla;
  }

  void dibujarFondoTexto(String t, color c) {
    pushStyle();
    noStroke();
    fill(c);
    rect(0, 0, width, 40);
    textAlign(CENTER);
    fill(255);
    textSize(27);
    text(t, width/2, 27);
    popStyle();
  }

  void dibujarPantalla() {
    if (pantalla == 0) {
      image(inicio, 0, 0, width, height);
      dibujarFondoTexto("Recolecta las monedas a tiempo para volver a casa", cInicio );
      botonInicio.actualizar();
    }
    if (pantalla == 2) {
      image(ganar, 0, 0, width, height);
      dibujarFondoTexto("Lo lograste, buen viaje", cGanar);
      botonVolver.actualizar();
      botonSeguir.actualizar();
    }
    if (pantalla == 3) {
      image(perder, 0, 0, width, height);
      dibujarFondoTexto("No recolectaste las monedas a tiempo", cPerder);
      botonVolver.actualizar();
      botonSeguir.actualizar();
    }
  }

  void actualizarPantalla() {
    if (contador>=50) {
      pantalla=2;
    }
  }

  void clickear() {
    if (pantalla == 0) {
      if (botonInicio.mouseEncima()) {
        tiempo.reiniciar(); //reinicia el reloj cuando apretas iniciar 
        pantalla = 1;
      }
    }
    if (pantalla == 2 || pantalla == 3) {
      if (botonVolver.mouseEncima()) {
        reiniciar();
      } if (botonSeguir.mouseEncima()) {
        
        if (pantalla == 2) { //camino p ganar no esta hecho
          reiniciar();
        } else {
          camino=2;
          jugando=false;
        }
      }
    }
  }

  void recolectarMonedas() {
    for (int i=0; i<monedasOriginales.length; i++) {
      float d = dist (mouseX, mouseY, monedasOriginales[i].posXM, monedasOriginales[i].posYM);
      if (d<monedasOriginales[i].tamMoneda && pantalla == 1) {
        monedasOriginales[i].recolectar();
        contador+=10;
      }
    }
  }

  void recolectarMonedasFalsas() {
    for (int j=0; j<monedasFalsas.length; j++) {
      float d = dist(mouseX, mouseY, monedasFalsas[j].posXF, monedasFalsas[j].posYF);
      if (d<=monedasFalsas[j].tamMoneda && pantalla == 1) {
        fill(0);
        textSize(15);
        text("¿para qué guardo estas monedas?", mouseX, mouseY);
        if (mousePressed) {
          contador--;
        }
      }
    }
  }

  void reiniciar() {
    contador=0;
    pantalla=0;
    jugando = false;
    camino = 0;
    //volvemos a crear loso bjetos para eivtar bug de reinicio
    for (int i=0; i<monedasOriginales.length; i++) {
      monedasOriginales[i] = new Moneda();
      monedasFalsas[i] = new Moneda();
    }
    for (int i=0; i<basura.length; i++) {
      basura[i] = new Basura ();
    }
  }
}
