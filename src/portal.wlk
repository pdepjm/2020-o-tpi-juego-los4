import wollok.game.*
import jugador.*
import objects.*
import juego.*
import disparo.*

class Portal inherits ObjetosAEsquivar{
	method velocidad() = 200

	method image() = "portal.png"
	
	override method efectoAlChocar(jugador){
		game.clear()
		game.addVisual(fondoEspacio)	
		cambioDeNivel.configurarNivel(espacio)
		cambioDeNivel.cambiarANivel(espacio)
	}
}

class PortalEspacio inherits Portal{
	override method image() = "portalEspacio.png"
	
	override method efectoAlChocar(jugador){
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
	const property imagenPerseguidor = "autoPolicia.png" 
	const property imagenFondo = " " 
	const property objGrande = "camionBasura.png" 
	const property objMediano = "autoPObjMediano.png" 
	const property objChico = "cono.png" 

	method iniciar(){	
		game.onTick(3500.randomUpTo(4500), "aparecer objeto grande", {nombreDelJuego.mover(new ObjetoGrande())})	
		game.onTick(2000.randomUpTo(3500), "aparecer objeto mediano", {nombreDelJuego.mover(new ObjetoMediano())})
		game.onTick(1000.randomUpTo(1500), "aparecer objeto chico", {nombreDelJuego.mover(new ObjetoChico())})
		game.onTick(20000.randomUpTo(5000), "aparecer portal espacio", {nombreDelJuego.mover(new Portal())})}
}

object espacio{
	const property imagenJugador = "navePersonaje.png"
	const property imagenPerseguidor = "navePerseguidor.png"
	const property imagenFondo = "space.jpg" 
	const property objGrande = "bigSpaceObject.png" 
	const property objMediano = "mediumSpaceObject.png" 
	const property objChico = "smallSpaceObject.png" 
	
	method iniciar(){
		game.onTick(3500.randomUpTo(4500), "aparecer objeto grande espacio", {nombreDelJuego.mover(new ObjetoGrandeEspacio())})	
		game.onTick(2000.randomUpTo(3500), "aparecer objeto mediano espacio", {nombreDelJuego.mover(new ObjetoMedianoEspacio())})
		game.onTick(1000.randomUpTo(1500), "aparecer objeto chico espacio", {nombreDelJuego.mover(new ObjetoChicoEspacio())})
		game.onTick(20000.randomUpTo(5000), "aparecer portal espacio", {nombreDelJuego.mover(new PortalEspacio())})
		keyboard.space().onPressDo({nombreDelJuego.probarDisparo(new Disparo())})
	}
}






