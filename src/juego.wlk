import wollok.game.*
import jugador.*
import objects.*
import portal.*

object nombreDelJuego {
				
	method iniciar() {
		self.configurarJuego()
		self.aparecerObjetos()
		self.configurarTeclasPersonaje()
		game.start()
	}
	
	method configurarJuego() {
		game.title("NOMBRE PENDIENTE")
		game.width(15)
		game.height(17)
		game.boardGround("carretera1.png") // Cuantos carriles? Cual va a ser el límite?
	}
									// Actual : ÁreaJugable: 400x750 y Limites Arriba y Abajo (respect.): 50x750
		
	method aparecerObjetos(){
		game.addVisual(personaje)
		game.addVisual(perseguidor)
		game.onTick(1800.randomUpTo(3800), "aparecer objeto grande", {self.mover(new ObjetoGrande())})	
		game.onTick(1000.randomUpTo(3000), "aparecer objeto mediano", {self.mover(new ObjetoMediano())})
		game.onTick(500.randomUpTo(3000), "aparecer objeto chico", {self.mover(new ObjetoChico())})
		game.onTick(10000.randomUpTo(25000), "aparecer portal", {self.mover(new Portal())})
	}
	
	method mover(miObjeto){
		miObjeto.aparecer()
		game.onTick(miObjeto.velocidad(), "moverse", {miObjeto.moverse(miObjeto.position().left(1))})
		game.onCollideDo(personaje, { visualColisionado => visualColisionado.chocarConJugador()})
	}
	
	method configurarTeclasPersonaje(){
		keyboard.up().onPressDo({ personaje.moverPersonaje(personaje.position().up(1))})
		keyboard.down().onPressDo({ personaje.moverPersonaje(personaje.position().down(1))})
	}
	method configurarColisiones(){
		game.onCollideDo(personaje, { algo => algo.chocarCon(personaje)})
	}
	
	method perder(){
		game.say(personaje, "mensaje sad de perdieron")
		self.terminar()
		}
	
	method ganar(){
		game.say(personaje, "mensaje fiesta de ganaron")
		self.terminar()
		
	}
	method terminar(){
		game.schedule(5*1000, {game.stop()})
		}
}

