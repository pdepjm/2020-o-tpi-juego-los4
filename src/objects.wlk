import wollok.game.*

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
	
	method chocarConJugador(){
		//INSTAKILL
	}	
}

class ObjetoMediano inherits ObjetosAEsquivar{		
	method image() = "placeholder_objeto_mediano.png"

	method velocidad() = 400
	
	method chocarConJugador(){	
		// que mueva un poco al jugador y baje vida
	}
}

class ObjetoChico inherits ObjetosAEsquivar{
	method image() = "placeholder_objeto_chico.png" 
	
	method velocidad() = 350
	
	method chocarConJugador(){	
		//mueve al jugador y baja menos vida q el mediano
		
	}
}
