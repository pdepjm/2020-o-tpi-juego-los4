import wollok.game.*

object personaje{ // podríamos poner un nombre más representativo como jugador(? protagonista(?
	var posicion = game.at(5, 2) //Falta cargar
	var imagen = "autoPersonaje.png"
	var estrellas = 0
	
	method cambiarImagen(){
		if (imagen == "autoPersonaje.png"){
			imagen = "navePersonaje.png"
		}else
			imagen = "autoPersonaje.png"
	} 
	
	method image() = imagen//Falta cargar 
	
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
	
	method cambiarImagen(){
		if (imagen == "autopoli.png"){
			imagen = "navePerseguidor.png"
		}else
			imagen = "autopoli.png"
	} 
	
	method position() = game.at(-1,personaje.position().y())
	
	method image() = imagen
}
