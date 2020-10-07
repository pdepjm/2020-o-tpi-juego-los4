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
		game.onTick(2000.randomUpTo(4000), "aparecer aleatoriamente", { self.crearYMoverGrande()})	
		game.onTick(1000.randomUpTo(2500), "aparecer aleatoriamente", { self.crearYMoverMediano()})
		game.onTick(400.randomUpTo(2500), "aparecer aleatoriamente", { self.crearYMoverChico()})
	}

	method crearYMoverGrande(){
		const miObjeto = new ObjetoGrande(posicion = game.at(20, 10))
		miObjeto.aparecer()
		game.onTick(380, "moverse", {miObjeto.moverse(miObjeto.position().left(1))})
	}
	
	method crearYMoverMediano(){
		const miObjeto = new ObjetoMediano(posicion = game.at(20, 10))
		miObjeto.aparecer()
		game.onTick(300, "moverse", {miObjeto.moverse(miObjeto.position().left(1))})
	}
	
	method crearYMoverChico(){
		const miObjeto = new ObjetoChico(posicion = game.at(20, 10))
		miObjeto.aparecer()
		game.onTick(270, "moverse", {miObjeto.moverse(miObjeto.position().left(1))})
	}
	
	method configurarTeclasPersonaje(){
		keyboard.up().onPressDo({ personaje.moverPersonaje(personaje.position().up(1))})
		keyboard.down().onPressDo({ personaje.moverPersonaje(personaje.position().down(1))})
	}

}

