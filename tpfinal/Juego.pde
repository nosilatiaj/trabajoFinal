class Juego {
  PImage inicio, ganar, perder;
  int pantalla, contador;
  String estado;
  int cantBasura = 35;
  int cantMonedas = 15;
  color cInicio = color (#F7EC02);
  color cGanar = color (0, 255, 0);
  color cPerder = color (255, 0, 0);
  Tiempo tiempo;
  Moneda moneda;
  Boton botonInicio, botonVolver, botonSeguir;
  Basura[] basura = new Basura [cantBasura];
  Moneda[] monedasOriginales = new Moneda [cantMonedas];
  Moneda[] monedasFalsas = new Moneda [cantMonedas];

  Juego () {
    tiempo = new Tiempo(10);
    botonInicio = new Boton ("Iniciar", width/2, 530, 170, 90);
    botonVolver = new Boton ("Volver", 200, 530, 170, 90);
    botonSeguir = new Boton ("Seguir", 500, 530, 170, 90);
    moneda = new Moneda();
    for (int i=0; i<basura.length; i++) {
      basura[i] = new Basura ();
    }
    for (int i=0; i<monedasOriginales.length; i++) {
      for (int j=0; j<monedasFalsas.length; j++) {
        monedasOriginales[i] = new Moneda();
        monedasFalsas[i] = new Moneda();
      }
    }
    inicio=loadImage("img0.jpg");
    ganar=loadImage("img2.jpg");
    perder=loadImage("img1.jpg");
  }

  void dibujarJuego() {
    println(pantalla);
    if (pantalla == 7) {
      for (int i=0; i<basura.length; i++) {
        basura[i].dibujar();
      }
      for (int i=0; i<monedasOriginales.length; i++) {
        for (int j=0; j<monedasFalsas.length; j++) {
          monedasOriginales[i].dibujarOriginales();
          monedasFalsas[i].dibujarFalsas();
        }
      }
    }
    fill(cInicio);
    rect(480, 13, 200, 30, 7);
    textSize(20);
    fill(0);
    text("Monedas  " + contador + "  /50", 580, 35);
    dibujarPantalla();
    actualizarPantalla();
    tiempo.start();
  }

  void cambiarAPantalla(int _pantalla) {
    pantalla = _pantalla;
  }


  int getPantalla() {
    return pantalla;
  }

  void dibujarFondoTexto(String t, color c) {
    noStroke();
    fill(c);
    rect(0, 0, width, 40);
    textAlign(CENTER);
    fill(0);
    textSize(20);
    text(t, width/2, 25);
  }

  void dibujarPantalla() {
    if (pantalla == 0) {
      image(inicio, 0, 0, width, height);
      dibujarFondoTexto("Recolecta las monedas a tiempo para volver a casa", cInicio );
      botonInicio.dibujar(0, 255);
    } 
    if (pantalla == 2) {
      image(ganar, 0, 0, width, height);
      dibujarFondoTexto("Lo lograste, buen viaje", cGanar);
      botonVolver.dibujar(0, 255);
      botonSeguir.dibujar(0, 255);
    }
    if (pantalla == 3) {
      image(perder, 0, 0, width, height);
      dibujarFondoTexto("No recolectaste las monedas a tiempo", cPerder);
      botonVolver.dibujar(0, 255);
      botonSeguir.dibujar(0, 255);
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
        pantalla = 1;
      }
    }
    if (pantalla == 2 || pantalla == 3) {
      if (botonVolver.mouseEncima()) {
        reiniciar();
      } else if (botonSeguir.mouseEncima()) {
        //pantalla siguiente de la aventura
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
  }
}
