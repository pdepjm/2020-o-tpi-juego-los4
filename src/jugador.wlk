import wollok.game.*

object personaje{ // podríamos poner un nombre más representativo como jugador(? protagonista(?
	var posicion = game.at(5, 2) 
	var imagen = "autoPersonaje.png"
	var estrellas = 0
	
	method cambiarImagen(nueva){
		imagen = nueva
	} 
	
	method image() = imagen
	
	method position() = posicion
		
	method moverPersonaje(posicionADondeMoverse){
		posicion = posicionADondeMoverse
	}
	
	method colleccionarEstrella(){
		estrellas += 1
	}
}

object perseguidor{
	var imagen = "autopoli.png"
	
	method cambiarImagen(nueva){
		imagen = nueva
	} 
	
	method position() = game.at(-1,personaje.position().y())
	
	method image() = imagen
}
