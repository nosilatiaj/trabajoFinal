class Basura {
  PImage clip, papel;
  float posXC, posYC, posXP, posYP;
  int tamBasura;

  Basura() {
    clip = loadImage("Basura1.png");
    papel = loadImage("Basura2.png");
    posXP = random (30, width-50);
    posYP = random (30, height-50);
    posXC = random (35, width-50);
    posYC = random (25, height-50);
    tamBasura = 40;
  }
 
 void dibujar(){
   image(clip, posXC, posYC, tamBasura, tamBasura);
   image(papel, posXP, posYP, tamBasura, tamBasura);
 }
}
