import wollok.game.*

object personaje{
	var posicion = game.at(4, 2) //Falta cargar
	
	method image() = "placeholder_jugador.png"//Falta cargar 
	
	method position() = posicion
		
	method moverPersonaje(posicionADondeMoverse){
		posicion = posicionADondeMoverse
	}
}
object perseguidor{
	
	method position() = game.at(0,personaje.position().y())
	
	method image() = "autopoli.png"
}
