import wollok.game.*
import jugador.*
import objects.*
import portal.*

object nombreDelJuego {
				
	method iniciar() {
		self.configurarJuego()
		self.aparecerObjetos()
		self.iniciarNivel("calle")
		self.configurarTeclasPersonaje()
		self.configurarColisiones()
		game.start()
	}
	
	method configurarJuego() {
		game.title("NOMBRE PENDIENTE")
		game.width(15)
		game.height(17)
		//game.boardGround("carretera1.png") // Cuantos carriles? Cual va a ser el límite? 
											//Actual: ÁreaJugable: 400x750, Limites Arriba y Abajo (respect.): 50x750)
		//game.showAttributes(personaje) //no se que es esto pero si lo descomento no anda nada
	}

	method aparecerObjetos(){
		game.addVisual(personaje)
		game.addVisual(perseguidor)
		//game.onTick(9000.randomUpTo(10000), "aparecer estrella", {self.mover(new Estrella())}) cambiar tamaño de la estrella
	}
	
	method iniciarNivel(nivel){
		if (nivel == "calle"){
			game.boardGround("carretera1.png")
			game.onTick(1800.randomUpTo(3800), "aparecer objeto grande", {self.mover(new ObjetoGrande())})	
			game.onTick(1000.randomUpTo(3000), "aparecer objeto mediano", {self.mover(new ObjetoMediano())})
			game.onTick(500.randomUpTo(3000), "aparecer objeto chico", {self.mover(new ObjetoChico())})
			game.onTick(10000.randomUpTo(15000), "aparecer portal espacio", {self.mover(new Portal())})
		}
		else if(nivel == "espacio") {       //esto supongo que debe hacerse separado medio repitiendo codigo xq como los objetos son una clase no se 
			game.boardGround("fondo_espacio.jpg")  //le puede cambiar la imagen a todos como con el jugador y el perseguidor
			game.onTick(1800.randomUpTo(3800), "aparecer objeto grande espacio", {self.mover(new ObjetoGrandeEspacio())})	
			game.onTick(1000.randomUpTo(3000), "aparecer objeto mediano espacio", {self.mover(new ObjetoMedianoEspacio())})
			game.onTick(500.randomUpTo(3000), "aparecer objeto chico espacio", {self.mover(new ObjetoChicoEspacio())})
			game.onTick(10000.randomUpTo(15000), "aparecer portal espacio", {self.mover(new PortalEspacio())})
		}
	} 
	
	method mover(miObjeto){
		miObjeto.aparecer()
		game.onTick(miObjeto.velocidad(), "moverse", {miObjeto.moverse(miObjeto.position().left(1))})
		game.onCollideDo(personaje, { visualColisionado => visualColisionado.chocarCon(personaje)}) 
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

