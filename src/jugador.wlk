import wollok.game.*

object personaje{
	var posicion = game.at(5, 2) //Falta cargar
	var imagen = "autopoli.png"
	
	method cambiarImagen(){
		if (imagen == "autopoli.png"){
			imagen = "nave.png"
		}else
			imagen = "autopoli.png"
	} 
	
	method image() = imagen//Falta cargar 
	
	method position() = posicion
		
	method moverPersonaje(posicionADondeMoverse){
		posicion = posicionADondeMoverse
	}
}
object perseguidor{
	var imagen = "autopoli.png"
	
	method cambiarImagen(){
		if (imagen == "autopoli.png"){
			imagen = "nave.png"
		}else
			imagen = "autopoli.png"
	} 
	
	method position() = game.at(-1,personaje.position().y())
	
	method image() = imagen
}
