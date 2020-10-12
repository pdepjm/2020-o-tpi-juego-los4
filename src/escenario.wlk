import wollok.game.*
import jugador.*
import objects.*

object escenario {
	const fondoCalle = "carretera1.png"
	const fondoEspacio = "fondo_espacio.png"
	
	var fondoActual = fondoCalle
	
	method image() = fondoActual
	
	method cambiarFondo(){
		fondoActual = fondoEspacio
	}
}
