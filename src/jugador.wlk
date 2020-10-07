import wollok.game.*

object personaje{
	var posicion = game.at(4, 2) //falta cargar
	
	method image() = "placeholder_jugador.png"//falta cargar 
	
	method position() = posicion
		
	method moverPersonaje(posicionADondeMoverse){
		posicion = posicionADondeMoverse
	}
}