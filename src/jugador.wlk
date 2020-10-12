import wollok.game.*

object personaje{
	var posicion = game.at(5, 2) //Falta cargar
	
	method image() = "autopoli.png"//Falta cargar 
	
	method position() = posicion
		
	method moverPersonaje(posicionADondeMoverse){
		posicion = posicionADondeMoverse
	}
}
object perseguidor{
	
	method position() = game.at(-1,personaje.position().y())
	
	method image() = "autopoli.png"
}
