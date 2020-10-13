import wollok.game.*
import jugador.*
import objects.*
import juego.*

class Portal inherits ObjetosAEsquivar{

	method velocidad() = 600
	
	method image() = "portal.png"
	
	method cambiarNivel(){
		personaje.cambiarImagen()
		perseguidor.cambiarImagen()
		game.removeVisual(personaje)
		game.removeVisual(perseguidor) /*pasar esto sin repetir código, hacer una clase para 
										jugador y perseguidor, crear clases para las cosas a
										* esquivar en el espacio y en juego.wlk poner un aparecerObjetos() 
										* específico para el espacio
										* Hay que agregarle el metodo chocarCon para que el personaje pueda colisionar*/
		nombreDelJuego.aparecerObjetos()
	}
	
}
