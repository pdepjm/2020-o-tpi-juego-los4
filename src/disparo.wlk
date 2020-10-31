import wollok.game.*
import jugador.*
import objects.*
import portal.*

class Disparo {
	var posicion = personaje.position().right(1)

	method velocidad() = 40
	
	method image() = "disparo.png"
	
	method position() = posicion

	method aparecer() {
		game.addVisual(self)	
	}
	
	method moverse(nuevaPosicion) {
		posicion = nuevaPosicion
	}
	
	method chocarCon(jugador){}
}

object arma{
	var property cargada = true
	
	method recargar(){
		cargada = true
	}
	method descargar(){
		cargada = false
	}
}

