import wollok.game.*
import jugador.*
import objects.*
import juego.*
import disparo.*

class Portal inherits ObjetosAEsquivar{
	method velocidad() = 200
	
	override method efectoAlChocar(jugador){
		game.clear()
		game.addVisual(fondoEspacio)	
		cambioDeNivel.configurarNivel(espacio)
		cambioDeNivel.cambiarANivel(espacio)
	}
}

class PortalEspacio inherits Portal{
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
		escape.aparecerObjetos()
		escape.configurarTeclasPersonaje()
		escape.configurarColisiones()
		escape.iniciarNivel(nivel)
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
	const property imagenPortal = "portal.png"

	method iniciar(){	
		game.onTick(3500.randomUpTo(4500), "aparecer objeto grande", {escape.mover(new ObjetoGrande(imagen = self.objGrande()))})	
		game.onTick(2000.randomUpTo(3500), "aparecer objeto mediano", {escape.mover(new ObjetoMediano(imagen = self.objMediano()))})
		game.onTick(2000.randomUpTo(1500), "aparecer objeto chico", {escape.mover(new ObjetoChico(imagen = self.objChico()))})
		game.onTick(6000.randomUpTo(8000), "aparecer portal espacio", {escape.mover(new Portal(imagen = self.imagenPortal()))})}
}

object espacio{
	const property imagenJugador = "navePersonaje.png"
	const property imagenPerseguidor = "navePerseguidor.png"
	const property imagenFondo = "space.jpg" 
	const property objGrande = "bigSpaceObject.png" 
	const property objMediano = "mediumSpaceObject.png" 
	const property objChico = "smallSpaceObject.png" 
	const property imagenPortal = "portalEspacio.png"
	
	method iniciar(){
		game.onTick(3500.randomUpTo(4500), "aparecer objeto grande espacio", {escape.mover(new ObjetoGrande(imagen = self.objGrande()))})	
		game.onTick(2000.randomUpTo(3500), "aparecer objeto mediano espacio", {escape.mover(new ObjetoMediano(imagen = self.objMediano()))})
		game.onTick(2000.randomUpTo(1500), "aparecer objeto chico espacio", {escape.mover(new ObjetoChico(imagen = self.objChico()))})
		game.onTick(6000.randomUpTo(8000), "aparecer portal espacio", {escape.mover(new PortalEspacio(imagen = self.imagenPortal()))})
		keyboard.space().onPressDo({escape.probarDisparo(new Disparo())})
	}
}






