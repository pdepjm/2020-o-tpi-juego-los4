import wollok.game.*
import jugador.*
import juego.*

class ObjetosAEsquivar{	
	var posicion = game.at(20, 10)

	method position() = posicion

	method aparecer() {
		game.addVisual(self)
		const x = game.width()
		const y = 0.randomUpTo(game.height())
		posicion = game.at(x, y)
	}
	
	method moverse(nuevaPosicion) {
		posicion = nuevaPosicion
	}
	
}

class ObjetoGrande inherits ObjetosAEsquivar {	
	method image() = "placeholder_objeto_grande.png"
		
	method velocidad() = 450
	
	method chocarCon(jugador){
		nombreDelJuego.perder()
		game.removeVisual(self)	
	}	
}

class ObjetoMediano inherits ObjetosAEsquivar{		
	method image() = "placeholder_objeto_mediano.png"

	method velocidad() = 400
	
	method chocarCon(jugador){
		personaje.moverPersonaje(personaje.position().left(2))
		game.removeVisual(self)	
	} 
}

class ObjetoChico inherits ObjetosAEsquivar{
	method image() = "placeholder_objeto_chico.png" 
	
	method velocidad() = 350
	
	method chocarCon(jugador){	
		personaje.moverPersonaje(personaje.position().left(1))
		game.removeVisual(self)	
	}
}

class ObjetoGrandeEspacio inherits ObjetoGrande{
	override method image() = "placeholder_objeto_grandeE.png" 
}

class ObjetoMedianoEspacio inherits ObjetoMediano{
	override method image() = "placeholder_objeto_medianoE.png" 
}

class ObjetoChicoEspacio inherits ObjetoChico{
	override method image() = "placeholder_objeto_chicoE.png" 
}



class Estrella inherits ObjetosAEsquivar{
	method image() = "estrella_amarilla.png"
	
	method velocidad()= 100
	
	method chocarCon(jugador){
		jugador.colleccionarEstrella()
		game.removeVisual(self)	
	}
}

