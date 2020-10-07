import wollok.game.*

object personaje{
	var posicion  //falta cargar
	var imagen = "placeholder_jugador.png"//falta cargar 
	
	method position() = posicion
		
	method moverPersonaje(posicionADondeMoverse){
		posicion = posicionADondeMoverse
	}
}