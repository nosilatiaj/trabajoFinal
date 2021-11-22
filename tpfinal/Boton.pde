class Boton{
//----Campos----//
Dato posición x, y
Dato tamaño x, y
Dato color
String para dibujar los textos sobre los botones

//-----Constructor-----//
posiciones x, y
tamaño x, y 
textoBotones="";

//-----Métodos-----//
void dibujar(); --> dibuja botones en la pantalla
void resaltar();--> con dondicional si paso el mouse por arriba hace el rect y el texto más grandes
void mostrarTexto();--> para los botones grandes que ocupan mitad de pantalla, se dibujan cuando paso el mouse por encima
}
