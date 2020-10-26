import wollok.game.*
import objects.*
import portal.*
import juego.*

object personaje{ // podríamos poner un nombre más representativo como jugador(? protagonista(?
	var posicion = game.at(5, 2) 
	var imagen = calle.imagenJugador()
	var estrellas = []
	method cambiarImagen(nueva){
		imagen = nueva
	} 
	
	method image() = imagen
	
	method position() = posicion
		
		
	method moverPersonaje(posicionADondeMoverse){
		if(limites.dentroDeLimites(self)){
			posicion = posicionADondeMoverse
		}else if(self.position().y() >= limites.limiteYSup()){
			posicion = self.position().down(2) //tuve que agregar este "rebote" porque con lo anterior el auto llegaba
		}else{  									//al borde y ya no lo podías mover mas
			posicion = self.position().up(2)	
		}
	}
	
	method coleccionarEstrella(unaEstrella){
		estrellas.add(unaEstrella)
		if(self.puntaje() >= 200){/**el 200 es momentaneo */
			nombreDelJuego.ganar()
		}else {
			
		}
	}
	
	method puntaje() = estrellas.sum({estrella => estrella.valor()})

}

object perseguidor{
	var imagen = calle.imagenPerseguidor()
	
	method cambiarImagen(nueva){
		imagen = nueva
	} 
	
	method position() = game.at(-1,personaje.position().y())
	
	method image() = imagen
}
