import wollok.game.*
import jugador.*
import objects.*
import juego.*

class Portal inherits ObjetosAEsquivar{

	method velocidad() = 200
	
	method image() = "portal.png"
	
	method chocarCon(jugador){
		game.clear()
		game.addVisual(fondoEspacio)	
		personaje.cambiarImagen()
		perseguidor.cambiarImagen()
		cambioDeNivel.cambiarANivel("espacio")
	}
}

class PortalEspacio inherits Portal{
	override method image() = "portalEspacio.png"
	
	override method chocarCon(jugador){
		game.clear()
		personaje.cambiarImagen()
		perseguidor.cambiarImagen()
		cambioDeNivel.cambiarANivel("calle")
	}
}


object cambioDeNivel{
	method cambiarANivel(nivel){
		nombreDelJuego.aparecerObjetos()
		nombreDelJuego.configurarTeclasPersonaje()
		nombreDelJuego.configurarColisiones()
		nombreDelJuego.iniciarNivel(nivel)
	}
}

object fondoEspacio{
	const posicion = game.at(0, 0)
	
	method position() = posicion
	
	method image() = "fondo_espacio.jpg"
}



