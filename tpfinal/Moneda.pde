class Moneda {
  PImage monedaOriginal, monedaFalsa;
  float posXM, posYM;
  float tamMoneda;
  float posXF, posYF;
  boolean recolectada; 

  Moneda () {
    monedaOriginal=loadImage("juego\\moneda.png");
    monedaFalsa=loadImage("juego\\monedasFalsas.png");
    posXM = random(30, width-50);
    posYM = random(30, height-50);
    posXF = random(30, width-50);
    posYF = random(30, height-50);
    tamMoneda = random (20, 40);
    recolectada = false;
  }

  void dibujarOriginales() {
    if (!recolectada) {
      image(monedaOriginal, posXM, posYM, tamMoneda, tamMoneda);
    } else {
      posXM = width+10;
      posYM = width+10;
    }
  }

  void recolectar() {
    recolectada = true;
  }

  void dibujarFalsas() {
    image(monedaFalsa, posXF, posYF, tamMoneda, tamMoneda);
  }
}
