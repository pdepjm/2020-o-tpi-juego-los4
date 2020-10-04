import wollok.game.*

class ObjetosAEsquivar{	
	var posicion
	
	method position() = posicion
	
	method aparecer() {
		game.addVisual(self)
		const x = 20 
		const y = 0.randomUpTo(game.height())
		posicion = game.at(x, y)
	}
	
	method moverse(nuevaPosicion) {
		posicion = nuevaPosicion
	}
}

class ObjetoGrande inherits ObjetosAEsquivar {
	method image() = "placeholder_objeto_grande.png"
	
	method chocarConJugador(){
		//INSTAKILL
	}	
}

class ObjetoMediano inherits ObjetosAEsquivar{			
	method image() = "placeholder_objeto_mediano.png"

	method chocarConJugador(){	
		// que mueva un poco al jugador y baje vida
	}
}

class ObjetoChico inherits ObjetosAEsquivar{
	method image() = "placeholder_objeto_chico.png" 
	
	method chocarConJugador(){	
		//mueve al jugador y baja menos vida q el mediano
		
	}
}
