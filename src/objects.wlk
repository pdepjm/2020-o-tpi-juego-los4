import wollok.game.*
import jugador.*
import juego.*

class ObjetosAEsquivar{	
	var posicion = game.at(20, 10)

	method position() = posicion

	method aparecer() {
		game.addVisual(self)
		const x = game.width()
		const y = 2.randomUpTo(game.height()-2) // Limite de la calle aprox 2 cuadros de cada lado. 
		posicion = game.at(x, y)
	}
	
	method moverse(nuevaPosicion) {
			posicion = nuevaPosicion
	}

	method desaparecer(){
		game.removeVisual(self)
	}
}

object limites{
	const property limiteX = 0 
	const property limiteYSup = 14 
	const property limiteYInf = 2
	
	method dentroDeLimites(objeto) = 
		objeto.position().x() >= self.limiteX() && 
		objeto.position().y() <= self.limiteYSup() &&
		objeto.position().y() >= self.limiteYInf()
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
	override method image() = "bigSpaceObject.png" 
}

class ObjetoMedianoEspacio inherits ObjetoMediano{
	override method image() = "mediumSpaceObject.png" 
}

class ObjetoChicoEspacio inherits ObjetoChico{
	override method image() = "smallSpaceObject.png" 
}

class EstrellaMayor inherits ObjetosAEsquivar{
	method image() = "estrella_amarilla.png"
	method valor() = 100
	method velocidad()= 100
	
	method chocarCon(jugador){
		jugador.colleccionarEstrella()
		game.removeVisual(self)	
		personaje.coleccionarEstrella(self)
	}
}
class EstrellaMenor inherits ObjetosAEsquivar{
	/**method image() = "buscando imagen...."*/
	method valor()= 50
	method velocidad()= 100
	
	method chocarCon(jugador){
		jugador.colleccionarEstrella()
		game.removeVisual(self)	
	}
}
