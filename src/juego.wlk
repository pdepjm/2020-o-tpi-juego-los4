import wollok.game.*
import jugador.*
import objects.*
import portal.*
import disparo.*

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
		game.onTick(15000.randomUpTo(15000), "aparecer estrella", {self.mover(new EstrellaMayor())})
		game.onTick(9000.randomUpTo(10000), "aparecer estrella", {self.mover(new EstrellaMenor())})
	}
	
	method iniciarNivel(nivel){
		if (nivel.nombreNivel() == "street"){
			game.onTick(3500.randomUpTo(4500), "aparecer objeto grande", {self.mover(new ObjetoGrande())})	
			game.onTick(2000.randomUpTo(3500), "aparecer objeto mediano", {self.mover(new ObjetoMediano())})
			game.onTick(1000.randomUpTo(1500), "aparecer objeto chico", {self.mover(new ObjetoChico())})
			game.onTick(20000.randomUpTo(5000), "aparecer portal espacio", {self.mover(new Portal())})
		}
		else if(nivel.nombreNivel() == "space") {      
			game.onTick(3500.randomUpTo(4500), "aparecer objeto grande espacio", {self.mover(new ObjetoGrandeEspacio())})	
			game.onTick(2000.randomUpTo(3500), "aparecer objeto mediano espacio", {self.mover(new ObjetoMedianoEspacio())})
			game.onTick(1000.randomUpTo(1500), "aparecer objeto chico espacio", {self.mover(new ObjetoChicoEspacio())})
			game.onTick(20000.randomUpTo(5000), "aparecer portal espacio", {self.mover(new PortalEspacio())})
			keyboard.space().onPressDo({self.probarDisparo(new Disparo())})
		}
	} 
	
	method mover(miObjeto){
		miObjeto.aparecer()
		game.onTick(miObjeto.velocidad(), "moverse", {miObjeto.moverse(miObjeto.position().left(1))})
		game.onCollideDo(personaje, { visualColisionado => visualColisionado.chocarCon(personaje)})
		game.onCollideDo(perseguidor, { visualColisionado => visualColisionado.chocarPerseguidor()}) 
		game.schedule(miObjeto.velocidad()*(game.width()+2), {self.sigueEnPantalla(miObjeto)}) //esto es para que no haya lag	
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

