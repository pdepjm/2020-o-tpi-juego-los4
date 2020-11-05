import wollok.game.*
import jugador.*
import juego.*

class ObjetosAEsquivar{	
	var posicion = game.at(20, 10)
	const imagen 
	
	method position() = posicion
	
	method image() = imagen

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
	
	method efectoAlChocar(jugador)
	
	method chocarPerseguidor(){} //si pongo esto como método abstracto no me deja instanciar	 
}

class ObjetoGrande inherits ObjetosAEsquivar {	
	method velocidad() = 300
	
	override method efectoAlChocar(jugador){
		nombreDelJuego.perder()	
	}	
}

class ObjetoMediano inherits ObjetosAEsquivar{	
	method velocidad() = 250
	
	override method efectoAlChocar(jugador){
		personaje.moverPersonaje(personaje.position().left(2))
	} 
}

class ObjetoChico inherits ObjetosAEsquivar{
	method velocidad() = 200
	
	override method efectoAlChocar(jugador){	
		personaje.moverPersonaje(personaje.position().left(1))
	}
}

//También podemos ver lo mismo acá en estrella para evitar repetir el coleccionar estrella
class Estrella inherits ObjetosAEsquivar{
	var modo = modoMayor
	method modo()= modo
	method velocidad()= 100
	
	override method efectoAlChocar(jugador){
		personaje.coleccionarEstrella(self)
		modo = modoMenor
		
	}
}

object modoMayor{
	method enviarMensaje()= "SUPER STAR + 20"
	method valor()= 20
}
object modoMenor{
	method enviarMensaje()= "STAR + 10"
	method valor()= 10
	
}


