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
	}
}

class PortalEspacio inherits Portal{
	override method image() = "portalEspacio.png"
	
	override method chocarCon(jugador){
		personaje.cambiarImagen()
		perseguidor.cambiarImagen()
		cambioDeNivel.iniciarNuevo("calle")
	}
}


object cambioDeNivel{
	method iniciarNuevo(nivel){
		if (nivel == "calle"){
			nombreDelJuego.aparecerObjetos()
			nombreDelJuego.iniciarNivelCalle()
			nombreDelJuego.configurarTeclasPersonaje()
			nombreDelJuego.configurarColisiones()
		}else if(nivel == "espacio"){
			nombreDelJuego.aparecerObjetos()
			nombreDelJuego.iniciarNivelEspacio()
			nombreDelJuego.configurarTeclasPersonaje()
			nombreDelJuego.configurarColisiones()
		}
	}
}




