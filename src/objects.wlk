import wollok.game.*

class Objetos{
	
	var posicion
	
	method position() = posicion
	
	method aparecer() {
		// coordenadas aleatorias dentro la pantalla
		const x = game.width() //aparece al borde
		const y = 0.randomUpTo(game.height())
		posicion = game.at(x, y)
	}
	
	method moverse(nuevaPosicion) {
		posicion = nuevaPosicion
	}
}

object objetoGrande {
	method image() = "placeholder_objeto_grande.png"
	
	method chocarConJugador(){
		//INSTAKILL
	}
	
}

object objetoMediano {
	method image() = "placeholder_objeto_mediano.png"

	method chocarConJugador(){
		
	}
}

object objetoChico {
	method image() = "placeholder_objeto_chico.png" 
	
	method chocarConJugador(){
		
	}
}
