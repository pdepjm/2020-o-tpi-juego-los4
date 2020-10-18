import wollok.game.*
import jugador.*
import juego.*

class ObjetosAEsquivar{	
	var posicion = game.at(20, 10)

	method position() = posicion

	method aparecer() {
		game.addVisual(self)
		const x = game.width()
		const y = 2.randomUpTo(game.height()-2) // Limite de la calle aprox 2. 
		posicion = game.at(x, y)
	}
	method desaparecer(){ // Los objetos se siguen moviendo fuera de pantalla. Llegado un punto se lagea todo, hay que eliminarlos apenas superen el límite en x.
		
	}
	
	method moverse(nuevaPosicion) {
		posicion = nuevaPosicion
	}
	
}

class ObjetoGrande inherits ObjetosAEsquivar {	
	method image() = "camionBasura.png" //Podría ir cambiando al azar, muy monotomo. 
		
	method velocidad() = 400
	
	method chocarCon(jugador){
		nombreDelJuego.perder()
		game.removeVisual(self)	
	}	
}

class ObjetoMediano inherits ObjetosAEsquivar{		
	method image() = "autoPObjMediano.png" //Podría ir cambiando al azar, muy monotomo. 

	method velocidad() = 350
	
	method chocarCon(jugador){
		personaje.moverPersonaje(personaje.position().left(2))
		game.removeVisual(self)	
	} 
}

class ObjetoChico inherits ObjetosAEsquivar{
	method image() = "cono.png"  //Podría ir cambiando al azar, muy monotomo. 
	
	method velocidad() = 300
	
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

