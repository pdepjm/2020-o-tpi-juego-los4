import wollok.game.*
import jugador.*
import objects.*

object nombreDelJuego {
				
	method iniciar() {
		self.configurarJuego()
		self.aparecerObjetos()
		self.configurarTeclasPersonaje()
		game.start()
	}
	
	method configurarJuego() {
		game.title("NOMBRE PENDIENTE")
		game.width(20)
		game.height(8)
		game.boardGround("carreteraRoja.png") // Cuantos carriles? Cual va a ser el límite?
	}											// Actual : ÁreaJugable: 300x1000 y Limites Arriba y Abajo (respect.): 50x1000
		
	method aparecerObjetos(){
		game.addVisual(personaje)
		game.onTick(1800.randomUpTo(3800), "aparecer objeto grande", {self.mover(new ObjetoGrande())})	
		game.onTick(1000.randomUpTo(3000), "aparecer objeto mediano", {self.mover(new ObjetoMediano())})
		game.onTick(500.randomUpTo(3000), "aparecer objeto chico", {self.mover(new ObjetoChico())})
	}
	
	method mover(miObjeto){
		miObjeto.aparecer()
		game.onTick(miObjeto.velocidad(), "moverse", {miObjeto.moverse(miObjeto.position().left(1))})
	}
	
	method configurarTeclasPersonaje(){
		keyboard.up().onPressDo({ personaje.moverPersonaje(personaje.position().up(1))})
		keyboard.down().onPressDo({ personaje.moverPersonaje(personaje.position().down(1))})
	}

}

