class Aventura {
  PImage pantallas [] = new PImage [83];
  int pantalla;
  //boolean click;
  Boton botonInicio, botonReinicio, botonCreditos, botonMitad;
  Aventura() {
    botonInicio = new Boton ("Iniciar", 200, 530, 170, 90);
    botonCreditos = new Boton ("Créditos", 500, 530, 170, 90);
    botonReinicio = new Boton ("Reiniciar", 200, 530, 170, 90);
    //Cargar imágenes del fondo
    for (int i=0; i <pantallas.length; i++) {
      pantallas [i] = loadImage("img" + i + ".jpg");
    }
    pantalla = 0;
    //click = false;
  }

  void dibujarAventura() {
    println(pantalla);
    for (int i=0; i < pantallas.length; i++) {
      if (pantalla == i) {
        image(pantallas [i], 0, 0, width, height);
      }
      botonEnPantalla();
    }
  }

  void botonEnPantalla () {
    if (pantalla == 0) {
      botonInicio.actualizar();
      botonCreditos.actualizar();
    } else if (pantalla == 36 || pantalla == 80 || pantalla == 81 ) {
      botonReinicio.actualizar();
      botonCreditos.actualizar();
    }
  }

  void caminoMouse() {
    if (pantalla == 0 && mouseX > 200 && mouseX < 370 && mouseY > 530 && mouseY < 610) {
      pantalla=1;
    } else if (pantalla == 0 && mouseX > 500 && mouseX < 370 && mouseY > 530 && mouseY < 610) {
      pantalla = 82; //pantalla créditos
    } else if (pantalla == 36 && mouseX > 200 && mouseX < 370 && mouseY > 530 && mouseY < 610) {
      pantalla = 0; // vuelve de los créditos
    } else if (pantalla == 36 && mouseX > 500 && mouseX < 370 && mouseY > 530 && mouseY < 610) {
      pantalla = 82;
    }
    if (pantalla == 82 && mouseX > 10 && mouseX < 150 && mouseY > 320 && mouseY < 390) {
      pantalla = 0;
    } //volver desde la pantalla de créditos

    if (pantalla == 80 || pantalla == 81) {
      if (mouseX > 200 && mouseX < 370 && mouseY > 530 && mouseY < 610) {
        pantalla = 0;
      } else if ( mouseX > 500 && mouseX < 370 && mouseY > 530 && mouseY < 610) {
        pantalla = 82;
      }
    }


    if (pantalla == 6 || pantalla == 29) {
      if (mouseX < width/2) {
        actualizarPantalla(pantalla, true);
      } else if (mouseX > width/2) {
        actualizarPantalla(pantalla, false);
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
  }

  void actualizarPantalla(int _pantalla, boolean camino) {
    println(_pantalla, "Estado nro: " + pantalla);
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
    } else if (_pantalla == 6 && camino) {
      pantalla = 7;
    } else {
      pantalla = 8;
    } 
    if (_pantalla == 7) {
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
