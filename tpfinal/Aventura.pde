class Aventura {
  Juego juego;
  PImage pantallas [] = new PImage [83];
  int pantalla;
  Boton botonInicio, botonReinicio, botonCreditos, botonIzq, botonDer;
  Dialogo dialogos;
 
  
  Aventura() {
    colorMode(HSB);
    botonInicio = new Boton ("Iniciar", 200, 530, 170, 90);
    botonCreditos = new Boton ("Creditos", 500, 530, 170, 90);
    botonReinicio = new Boton ("Reiniciar", 200, 530, 170, 90);
    botonIzq = new Boton ("Consultar", 0, 0, 350, height);
    botonDer = new Boton ("Esperar", width/2, 0, 350, height);
    dialogos = new Dialogo ();
    juego = new Juego ();
    //Cargar imágenes del fondo
    for (int i=0; i <pantallas.length; i++) {
      pantallas [i] = loadImage("img" + i + ".jpg");
    }
    pantalla = 0;
    //click = false;
  }

  void dibujarAventura() {
    for (int i=0; i < pantallas.length; i++) {
      if (pantalla == i) {
        image(pantallas [i], 0, 0, width, height);
      }
      if (pantalla == 6){
        if(juego.camino == 1){
          pantalla = 7;
          juego.reiniciar(); //si ganas (esta incompleto)
        }
        if(juego.camino == 2){
          pantalla=8; //si perdes se reinicia el juego y sigue la aventura
          juego.reiniciar();
        }
      }
      botonEnPantalla();
    }
    //dialogos.dibujar();

    if (pantalla>0) {
      actualizarDialogos();
      // dialogos.dibujar(0, 500, width-1, 100);
    }
  }

  void botonEnPantalla () {
    if (pantalla == 0) {
      botonInicio.dibujar(0, 255);
      botonCreditos.dibujar(0, 255);
    } else if (pantalla == 36 || pantalla == 80 || pantalla == 81 ) {
      botonReinicio.dibujar(0, 255);
      botonCreditos.dibujar(0, 255);
    }
    if (pantalla == 29) {
      if (mouseX < width/2) {
        botonIzq.dibujarBotMitad();
      } else if (mouseX > width/2) {
        botonDer.dibujarBotMitad();
      }
    }
  }

  boolean zonaCuadrada (float x1, float x2, float y1, float y2 ) {
    if (mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2) {
      return true;
    } else {
      return false;
    }
  }

  void caminoMouse() {
    if (pantalla == 0 && zonaCuadrada(200, 370, 530, 610)) {
      pantalla=1;
    } else if (pantalla == 0 && zonaCuadrada(500, 370, 530, 610)) {
      pantalla = 82; //pantalla créditos
    } else if (pantalla == 36 && zonaCuadrada(200, 370, 530, 610)) {
      pantalla = 0; // vuelve de los créditos
    } else if (pantalla == 36 && zonaCuadrada(500, 370, 530, 610)) {
      pantalla = 82;
    }
    if (pantalla == 82 && zonaCuadrada(10, 150, 320, 390)) {
      pantalla = 0;
    } //volver desde la pantalla de créditos

    if (pantalla == 80 || pantalla == 81) {
      if (zonaCuadrada(200, 370, 530, 610)) {
        pantalla = 0;
      } else if ( zonaCuadrada(500, 370, 530, 610)) {
        pantalla = 82;
      }
    }

    if (pantalla == 6 || pantalla == 29) {
      if (mouseX < width/2) {
        actualizarPantalla(pantalla, true);
        //actualizarPantalla(true);
      } else if (mouseX > width/2) {
        actualizarPantalla(pantalla, false);
        //actualizarPantalla(false);
      }
    }
  }

  void caminoTecla() {
    if (keyCode ==  RIGHT && pantalla !=6 && pantalla !=0 && pantalla !=36) {
      if (pantalla !=29 && pantalla !=54 && pantalla !=80 && pantalla !=81) {
        actualizarPantalla(pantalla, true);
      }
      
    }
    if (keyCode == 'A' && pantalla == 54) {
      pantalla = 55;
    } 
    if (keyCode == 'B' && pantalla == 54) {
      pantalla = 62;
    }
    if (keyCode == 'C' && pantalla == 54) {
      pantalla = 74;
    }
    if (keyCode == RIGHT) {
      // dialogos.pasarDialogo();
    }
  }
  /*void pasarDialogo() {
   if (pantalla == 1) {
   dialogos.getIndice(1);
   } else {
   //indiceDeTexto = 0;
   }
   }*/

   void actualizarDialogos() { 
    if (pantalla == 1) {
      dialogos.dibujar();
      dialogos.getIndice(0);
    } else if (pantalla == 2) {
      dialogos.dibujar();
      dialogos.getIndice(1);
    } else if (pantalla == 6) {
      dialogos.dibujar();
      dialogos.getIndice(2);
    } else if (pantalla == 8) {
      dialogos.dibujar();
      dialogos.getIndice(4);
    } else if (pantalla == 13) {
      dialogos.dibujar();
      dialogos.getIndice(5);
    } else if (pantalla == 14) {
      dialogos.dibujar();
      dialogos.getIndice(6);
    } else if (pantalla == 24) {
      dialogos.dibujar();
      dialogos.getIndice(7);
    } else if (pantalla == 25) {
      dialogos.dibujar();
      dialogos.getIndice(8);
    } else if (pantalla == 28) {
      dialogos.dibujar();
      dialogos.getIndice(9);
    } else if (pantalla == 38) {
      dialogos.dibujar();
      dialogos.getIndice(10);
    } else if (pantalla == 39) {
      dialogos.dibujar();
      dialogos.getIndice(11);
    } else if (pantalla == 41) {
      dialogos.dibujar();
      dialogos.getIndice(12);
    } else if (pantalla == 43) {
      dialogos.dibujar();
      dialogos.getIndice(13);
    } else if (pantalla == 45) {
      dialogos.dibujar();
      dialogos.getIndice(14);
    } else if (pantalla == 48) {
      dialogos.dibujar();
      dialogos.getIndice(15);
    } else if (pantalla == 50) {
      dialogos.dibujar();
      dialogos.getIndice(16);
    } else if (pantalla == 53) {
      dialogos.dibujar();
      dialogos.getIndice(17);
    } else if (pantalla == 54) { // 3 CAMINOS
      dialogos.dibujar();
      dialogos.getIndice(18);
    } else if (pantalla == 55) { // CAMINO A (CONSULTAR)
      dialogos.dibujar();
      dialogos.getIndice(19);
    } else if (pantalla == 57) {
      dialogos.dibujar();
      dialogos.getIndice(20);
    } else if (pantalla == 58) {
      dialogos.dibujar();
      dialogos.getIndice(21);
    } else if (pantalla == 59) {
      dialogos.dibujar();
      dialogos.getIndice(22);
    } else if (pantalla == 60) {
      dialogos.dibujar();
      dialogos.getIndice(23);
    } else if (pantalla == 61) {
      dialogos.dibujar();
      dialogos.getIndice(24);
    } else if (pantalla == 62) { // CAMINO B (AYUDA)
      dialogos.dibujar();
      dialogos.getIndice(25);
    } else if (pantalla == 63) {
      dialogos.dibujar();
      dialogos.getIndice(26);
    } else if (pantalla == 65) {
      dialogos.dibujar();
      dialogos.getIndice(27);
    } else if (pantalla == 67) {
      dialogos.dibujar();
      dialogos.getIndice(28);
    } else if (pantalla == 68) {
      dialogos.dibujar();
      dialogos.getIndice(29);
    } else if (pantalla == 71) {
      dialogos.dibujar();
      dialogos.getIndice(30);
    } else if (pantalla == 73) {
      dialogos.dibujar();
      dialogos.getIndice(31);
    } else if (pantalla == 74) { //CAMINO C (COMER)
      dialogos.dibujar();
      dialogos.getIndice(32);
    } else if (pantalla == 79) {
      dialogos.dibujar();
      dialogos.getIndice(33);
    } else {
      dialogos.getIndice(0);
    }
  }


  void cambiarPantalla(int nuevaPantalla){
    pantalla = nuevaPantalla;
  }
  
   void actualizarPantalla(int _pantalla, boolean camino) {
   if (_pantalla == 1) {
   pantalla = 2;
   } else if (_pantalla == 2) {
   pantalla = 3;
   } else if (_pantalla == 3) {
   pantalla = 4;
   } else if (_pantalla == 4) {
   pantalla = 5;
   } else if (_pantalla == 5) {
   pantalla = 6;
   //cambiarPantalla(06);
   } else if (_pantalla == 06 && camino ) { 
     //esta es la pantalla a reemplazar con el juego     
     juego.jugando = true;
   } if(pantalla == 7){
   pantalla = 0;
   } else if (_pantalla == 8) {
   pantalla = 9;
   } else if (_pantalla == 9) {
   pantalla = 10;
   } else if (_pantalla == 10) {
   pantalla = 11;
   } else if (_pantalla == 11) {
   pantalla = 12;
   } else if (_pantalla == 12) {
   pantalla = 13;
   } else if (_pantalla == 13) {
   pantalla = 14;
   } else if (_pantalla == 14) {
   pantalla = 15;
   } else if (_pantalla == 15) {
   pantalla = 16;
   } else if (_pantalla == 16) {
   pantalla = 17;
   } else if (_pantalla == 17) {
   pantalla = 18;
   } else if (_pantalla == 18) {
   pantalla = 19;
   } else if (_pantalla == 19) {
   pantalla = 20;
   } else if (_pantalla == 20) {
   pantalla = 21;
   } else if (_pantalla == 21) {
   pantalla = 22;
   } else if (_pantalla == 22) {
   pantalla = 23;
   } else if (_pantalla == 23) {
   pantalla = 24;
   } else if (_pantalla == 24) {
   pantalla = 25;
   } else if (_pantalla == 25) {
   pantalla = 26;
   } else if (_pantalla == 26) {
   pantalla = 27;
   } else if (_pantalla == 27) {
   pantalla = 28;
   } else if (_pantalla == 28) {
   pantalla = 29;
   } else if (_pantalla == 29 && camino == false) {
   pantalla = 30;
   } else if (_pantalla == 30) {
   pantalla = 31;
   } else if (_pantalla == 31) {
   pantalla = 32;
   } else if (_pantalla == 32) {
   pantalla = 33;
   } else if (_pantalla == 33) {
   pantalla = 34;
   } else if (_pantalla == 34) {
   pantalla = 35;
   } else if (_pantalla == 35) {
   pantalla = 36; // Final ancianos
   } else if (_pantalla == 29 && camino) {
   pantalla = 37;
   } else if (_pantalla == 37) {
   pantalla = 38;
   } else if (_pantalla == 38) {
   pantalla = 39;
   } else if (_pantalla == 39) {
   pantalla = 40;
   } else if (_pantalla == 40) {
   pantalla = 41;
   } else if (_pantalla == 41) {
   pantalla = 42;
   } else if (_pantalla == 42) {
   pantalla = 43;
   } else if (_pantalla == 43) {
   pantalla = 44;
   } else if (_pantalla == 44) {
   pantalla = 45;
   } else if (_pantalla == 45) {
   pantalla = 46;
   } else if (_pantalla == 46) {
   pantalla = 47;
   } else if (_pantalla == 47) {
   pantalla = 48;
   } else if (_pantalla == 48) {
   pantalla = 49;
   } else if (_pantalla == 49) {
   pantalla = 50;
   } else if (_pantalla == 50) {
   pantalla = 51;
   } else if (_pantalla == 51) {
   pantalla = 52;
   } else if (_pantalla == 52) {
   pantalla = 53;
   } else if (_pantalla == 53) {
   pantalla = 54;
   } else if (_pantalla == 55) {
   pantalla = 56;
   } else if (_pantalla == 56) {
   pantalla = 57;
   } else if (_pantalla == 57) {
   pantalla = 58;
   } else if (_pantalla == 58) {
   pantalla = 59;
   } else if (_pantalla == 59) {
   pantalla = 60;
   } else if (_pantalla == 60) {
   pantalla = 61;
   } else if (_pantalla == 61) { 
   pantalla = 80; //FINAL A consultar
   } else if (_pantalla == 54) {
   pantalla = 62;
   } else if (_pantalla == 62) {
   pantalla = 63;
   } else if (_pantalla == 63) {
   pantalla = 64;
   } else if (_pantalla == 64) {
   pantalla = 65;
   } else if (_pantalla == 65) {
   pantalla = 66;
   } else if (_pantalla == 66) {
   pantalla = 67;
   } else if (_pantalla == 67) {
   pantalla = 68;
   } else if (_pantalla == 68) {
   pantalla = 69;
   } else if (_pantalla == 69) {
   pantalla = 70;
   } else if (_pantalla == 70) {
   pantalla = 71;
   } else if (_pantalla == 71) {
   pantalla = 72;
   } else if (_pantalla == 72) {
   pantalla = 73;
   } else if (_pantalla == 73) {
   pantalla = 81; //FINAL B pez linterna
   } else if (_pantalla == 54) {
   pantalla = 74;
   } else if (_pantalla == 74) {
   pantalla = 75;
   } else if (_pantalla == 75) {
   pantalla = 76;
   } else if (_pantalla == 76) {
   pantalla = 77;
   } else if (_pantalla == 77) {
   pantalla = 78;
   } else if (_pantalla == 78) {
   pantalla = 79;
   } else if (_pantalla == 79) {
   pantalla = 80; //FINAL C comer
   }
   }
}
