import wollok.game.*
import jugador.*
import objects.*
import juego.*

class Portal inherits ObjetosAEsquivar{

	method velocidad() = 600
	
	method image() = "portal.png"
	
	method chocarCon(jugador){
		personaje.cambiarImagen()
		perseguidor.cambiarImagen()
		game.clear()
		cambioDeNivel.iniciarNuevo("espacio")
		game.removeVisual(self)	
	}
}

class PortalEspacio inherits Portal{
	override method image() = "portalEspacio.png"
	
	override method chocarCon(jugador){
		personaje.cambiarImagen()
		perseguidor.cambiarImagen()
		game.clear()
		cambioDeNivel.iniciarNuevo("calle")
		game.removeVisual(self)	
	}
}


object cambioDeNivel{
	method iniciarNuevo(nivel){
		nombreDelJuego.aparecerObjetos()
		nombreDelJuego.iniciarNivel(nivel)
		nombreDelJuego.configurarTeclasPersonaje()
		nombreDelJuego.configurarColisiones()
	}
}




