import wollok.game.*
import jugador.*
import objects.*
import portal.*
import disparo.*

object escape{
				
	method iniciar() {
		self.configurarJuego()
		self.aparecerObjetos()
		self.iniciarNivel(calle)
		self.configurarTeclasPersonaje()
		self.configurarColisiones()
		game.start()
	}
	
	method configurarJuego() {
		game.title("ESCAPE")
		game.width(15)
		game.height(17)
		game.boardGround("carretera2.png") // Cuantos carriles? Cual va a ser el límite? 
											//Actual: ÁreaJugable: 400x750, Limites Arriba y Abajo (respect.): 50x750)
	}

	method aparecerObjetos(){
		game.addVisual(personaje)
		game.addVisual(perseguidor)
		game.showAttributes(personaje) 
		game.onTick(15000.randomUpTo(15000), "aparecer estrella", {self.mover(new Estrella(modo = modoMayor, imagen = "estrella_amarilla.png"))})
		game.onTick(9000.randomUpTo(10000), "aparecer estrella", {self.mover(new Estrella(modo = modoMenor, imagen = "strellaAzul.png"))})
	}

	method iniciarNivel(nivel){
		nivel.iniciar()
	}
	
	method mover(miObjeto){
		miObjeto.aparecer()
		game.onTick(miObjeto.velocidad(), "moverse", {miObjeto.moverse(miObjeto.position().left(1))})
		game.onCollideDo(personaje, { visualColisionado => visualColisionado.chocarCon(personaje)})
		game.onCollideDo(perseguidor, { visualColisionado => visualColisionado.chocarPerseguidor()}) 
		game.schedule(miObjeto.velocidad()*(game.width()+5), {self.sigueEnPantalla(miObjeto)}) //esto es para que no haya lag	
	}				
	
	method configurarTeclasPersonaje(){
		keyboard.up().onPressDo({ personaje.moverPersonaje(personaje.position().up(1))})
		keyboard.down().onPressDo({ personaje.moverPersonaje(personaje.position().down(1))})
	}
	
	method configurarColisiones(){
		game.onCollideDo(personaje, { algo => algo.chocarCon(personaje)})
	}
		
	method probarDisparo(disparado){
		if(arma.cargada()){
			self.disparar(disparado)
		}else{}
	}
	
	method disparar(disparado){
		disparado.aparecer()
		arma.descargar()
		game.onTick(disparado.velocidad(), "disparar", {disparado.moverse(disparado.position().right(1))})	
		game.onCollideDo(disparado, { visualColisionado => game.removeVisual(visualColisionado)}) 
		game.schedule(400, {game.removeVisual(disparado)})
		game.onTick(2500,"recargar arma",{arma.recargar()})
	}
	
	method sigueEnPantalla(miObjeto){
		if(game.hasVisual(miObjeto)){
			game.removeVisual(miObjeto)
		}else{}
	}
	
//En los métodos perder y ganar quisieramos mostrar el puntaje alcanzado hasta entonces
// y también estaría bueno de hacer un reportaje de la cantidad de choques con objetos medianos y chicos (como para mostrar el desempeño del juagdor)

	method perder(){
		personaje.moverPersonaje(game.at(5, 5))
		self.terminar()
	}
	
	method perderAplastado(){
		game.say(personaje, "¡FUISTE APLASTADO!")
		self.perder()
	}
	method perderAtrapado(){
		game.say(personaje, "¡FUISTE ATRAPADO!")
		self.perder()
	}
	
	method ganar(){
		personaje.moverPersonaje(game.at(5, 2))
		game.say(personaje, "¡FELICITACIONES, HAS ESCAPADO CON ÉXITO!") 
		self.terminar()		
	}
	
	method terminar(){
		game.schedule(5*1000, {game.stop()})
	}
}


