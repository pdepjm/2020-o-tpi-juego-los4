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
		self.cambiarImagen(espacio.imagenPortal())
		cambioDeNivel.configurarNivel(espacio)
		cambioDeNivel.cambiarANivel(espacio)
	}
}

class PortalEspacio inherits Portal{
	override method image() = "portalEspacio.png"
	
	override method chocarCon(jugador){
		game.clear()
		cambioDeNivel.configurarNivel(calle)
		cambioDeNivel.cambiarANivel(calle)
	}
}

object cambioDeNivel{
	
	method configurarNivel(nivel){
		personaje.cambiarImagen(nivel.imagenJugador())
		perseguidor.cambiarImagen(nivel.imagenPerseguidor())
	}
	
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






