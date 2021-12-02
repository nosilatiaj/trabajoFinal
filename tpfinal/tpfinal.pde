Aventura aventura;

void setup(){
  size(700,600);
  aventura = new Aventura();
}

void draw(){
  if (aventura.juego.jugando){
    background(#9B6F2D);
    aventura.juego.dibujarJuego();
  }
  else{
    aventura.dibujarAventura();
  }
}

void mousePressed(){
  aventura.caminoMouse();
  aventura.juego.clickear();
  aventura.juego.recolectarMonedas();
  aventura.juego.recolectarMonedasFalsas();
}

void keyPressed(){
  aventura.caminoTecla();
  
}
