import wollok.game.*
import objects.*
import portal.*

object personaje{ // podríamos poner un nombre más representativo como jugador(? protagonista(?
	var posicion = game.at(5, 2) 
	var imagen = calle.imagenJugador()
	var estrellas = 0
	
	method cambiarImagen(nueva){
		imagen = nueva
	} 
	
	method image() = imagen
	
	method position() = posicion
		
	method moverPersonaje(posicionADondeMoverse){
		if(limites.dentroDeLimites(self)){
			posicion = posicionADondeMoverse
		}else if(self.position().y() >= limites.limiteYSup()){
			posicion = self.position().down(2)
		}else{ 
			posicion = self.position().up(1)	
		}
	}
	
	method colleccionarEstrella(){
		estrellas += 1
	}
}

object perseguidor{
	var imagen = calle.imagenPerseguidor()
	
	method cambiarImagen(nueva){
		imagen = nueva
	} 
	
	method position() = game.at(-1,personaje.position().y())
	
	method image() = imagen
}
