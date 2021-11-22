Aventura aventura;
void setup(){
  size(700,600);
  aventura = new Aventura();
}

void draw(){
  
aventura.dibujarAventura();
}
void mousePressed(){
  aventura.caminoMouse();
}
void keyPressed(){
  aventura.caminoTecla();
  
}
