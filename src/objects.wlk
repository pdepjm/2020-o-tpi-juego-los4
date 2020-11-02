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

	method chocarCon(jugador){
		game.removeVisual(self)
		self.efectoAlChocar(jugador)
	}
	
	method efectoAlChocar(jugador){}
	
	method chocarPerseguidor(){}
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

//Opción para evitar repetición de lógica al mover personaje, la dejo comentada porque al heredar ObjetosAEsquivar, 
//no sé si nos traiga conflictos con el método aparecer y el tema de las imagenes y eso. Lo podemos consultar el finde

/*class ObjetosQueEmpujan inherits ObjetosAEsquivar{
	method empujar(cantPos){
		personaje.moverPersonaje(personaje.position().left(cantPos))	
	}
}

class ObjetoMediano inherits ObjetosQueEmpujan{		
	method image() = "autoPObjMediano.png" //Podría ir cambiando al azar, muy monotomo. 

	method velocidad() = 350
	
	override method chocarCon(jugador){
		self.empujar(2)
	} 
}

class ObjetoChico inherits ObjetosQueEmpujan{
	method image() = "cono.png"  //Podría ir cambiando al azar, muy monotomo. 
	
	method velocidad() = 300
	
	override method chocarCon(jugador){	
		self.empujar(1)
	}
}*/


class ObjetoGrande inherits ObjetosAEsquivar {	
	method image() = "camionBasura.png" //Podría ir cambiando al azar, muy monotomo. 
		
	method velocidad() = 300
	
	override method efectoAlChocar(jugador){
		nombreDelJuego.perder()	
	}	
	
}

class ObjetoMediano inherits ObjetosAEsquivar{		
	method image() = "autoPObjMediano.png" //Podría ir cambiando al azar, muy monotomo. 

	method velocidad() = 250
	
	override method efectoAlChocar(jugador){
		personaje.moverPersonaje(personaje.position().left(2))
	} 
}

class ObjetoChico inherits ObjetosAEsquivar{
	method image() = "cono.png"  //Podría ir cambiando al azar, muy monotomo. 
	
	method velocidad() = 200
	
	override method efectoAlChocar(jugador){	
		personaje.moverPersonaje(personaje.position().left(1))
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


//También podemos ver lo mismo acá en estrella para evitar repetir el coleccionar estrella
class EstrellaMayor inherits ObjetosAEsquivar{
	method image() = "estrella_amarilla.png"
	method valor() = 100
	method velocidad()= 100
	
	override method efectoAlChocar(jugador){
		personaje.coleccionarEstrella(self)
		
	}
}
class EstrellaMenor inherits ObjetosAEsquivar{
	method image() = "strellaAzul.png"
	method valor()= 50
	method velocidad()= 100
	
	override method efectoAlChocar(jugador){
		personaje.coleccionarEstrella(self)	
	}
}
