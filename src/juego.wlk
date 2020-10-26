import wollok.game.*
import jugador.*
import objects.*
import portal.*

object nombreDelJuego {
				
	method iniciar() {
		self.configurarJuego()
		self.aparecerObjetos()
		self.iniciarNivel(calle)
		self.configurarTeclasPersonaje()
		self.configurarColisiones()
		game.start()
	}
	
	method configurarJuego() {
		game.title("NOMBRE PENDIENTE")
		game.width(15)
		game.height(17)
		game.boardGround("carretera2.png") // Cuantos carriles? Cual va a ser el límite? 
											//Actual: ÁreaJugable: 400x750, Limites Arriba y Abajo (respect.): 50x750)
	}

	method aparecerObjetos(){
		game.addVisual(personaje)
		game.addVisual(perseguidor)
		game.showAttributes(personaje) 
		game.onTick(9000.randomUpTo(10000), "aparecer estrella", {self.mover(new EstrellaMayor())})
		game.onTick(9000.randomUpTo(10000), "aparecer estrella", {self.mover(new EstrellaMenor())})
	}
	
	method iniciarNivel(nivel){
		if (nivel == calle){
			game.onTick(3200.randomUpTo(3800), "aparecer objeto grande", {self.mover(new ObjetoGrande())})	
			game.onTick(1600.randomUpTo(3000), "aparecer objeto mediano", {self.mover(new ObjetoMediano())})
			game.onTick(1000.randomUpTo(3000), "aparecer objeto chico", {self.mover(new ObjetoChico())})
			game.onTick(2000.randomUpTo(1500), "aparecer portal espacio", {self.mover(new Portal())})
		}
		else if(nivel == espacio) {      
			game.onTick(3200.randomUpTo(3800), "aparecer objeto grande espacio", {self.mover(new ObjetoGrandeEspacio())})	
			game.onTick(1600.randomUpTo(3000), "aparecer objeto mediano espacio", {self.mover(new ObjetoMedianoEspacio())})
			game.onTick(1000.randomUpTo(3000), "aparecer objeto chico espacio", {self.mover(new ObjetoChicoEspacio())})
			game.onTick(2000.randomUpTo(1500), "aparecer portal espacio", {self.mover(new PortalEspacio())})
		}
	} 
	
	method mover(miObjeto){
		miObjeto.aparecer()
		game.onTick(miObjeto.velocidad(), "moverse", {miObjeto.moverse(miObjeto.position().left(1))})
		game.onCollideDo(personaje, { visualColisionado => visualColisionado.chocarCon(personaje)}) 
		game.onCollideDo(perseguidor, { visualColisionado => game.removeVisual(visualColisionado)}) 
		//game.onCollideDo(barrera, { visualColisionado => visualColisionado.desaparecer()}) 	
	}					//IMPLEMENTAR
	
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

