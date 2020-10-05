import wollok.game.*
import pepita.*
import objects.*

object nombreDelJuego {
				
	method iniciar() {
		self.configurarJuego()
		self.aparecerObjetos()
		game.start()
	}
	
	method configurarJuego() {
		game.title("NOMBRE PENDIENTE")
		game.width(20)
		game.height(10)
	}
		
	method aparecerObjetos(){
		game.onTick(1000.randomUpTo(4000), "aparecer aleatoriamente", { self.crearYMoverGrande()})	
		game.onTick(800.randomUpTo(2500), "aparecer aleatoriamente", { self.crearYMoverMediano()})
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
	


}

