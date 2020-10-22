import wollok.game.*
import jugador.*
import objects.*
import juego.*

class Portal inherits ObjetosAEsquivar{
	var imagen = "portal.png"

	method velocidad() = 200

	method image() = imagen
	
	method cambiarImagen(nueva){
		imagen = nueva
	} 
	
	method chocarCon(jugador){
		game.clear()
		game.addVisual(fondoEspacio)	
		personaje.cambiarImagen(espacio.imagenJugador())
		perseguidor.cambiarImagen(espacio.imagenPerseguidor())
		self.cambiarImagen(espacio.imagenPortal())
		cambioDeNivel.cambiarANivel(espacio)
	}
}

class PortalEspacio inherits Portal{
	override method image() = "portalEspacio.png"
	
	override method chocarCon(jugador){
		game.clear()
		personaje.cambiarImagen(calle.imagenJugador())
		perseguidor.cambiarImagen(calle.imagenPerseguidor())
		cambioDeNivel.cambiarANivel(calle)
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
	
	method image() = "space.jpg"
}

object calle{
	const property imagenJugador = "autoPersonaje.png"
	const property imagenPerseguidor = "autopoli.png"
	const property imagenPortal = "portal.png" 
}

object espacio{
	const property imagenJugador = "navePersonaje.png"
	const property imagenPerseguidor = "navePerseguidor.png"
	const property imagenPortal = "portalEspacio.png"
}






