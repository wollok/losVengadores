import wollok.game.*
import heroes.*
import Armas.*

object losVengadoresGame {
	
	method jugar(){
		self.configurarPantalla()
		self.configurarCursor()
		self.agregarPersonajes()
		self.definirControles()
		game.start();
	}
	
	method configurarPantalla(){
		game.title("Vengadores Game")
		game.width(20)
		game.height(13)
		game.boardGround("fondoDeBatalla.jpg")
	}
	
	method configurarCursor(){
		game.addVisualCharacter(cursor)
		game.whenCollideDo(cursor,{personaje => cursor.seleccionarHeroe(personaje)})
	}
	
	method agregarPersonajes(){
		game.addVisual(ironMan)
		game.addVisual(hulk)
		game.addVisual(capitanAmerica)
		game.addVisual(thor)
		game.addVisual(escudito)
		game.addVisual(escudoSimple)
		game.addVisual(wakanda)
		//game.addVisual(cacerola)
	}
	
	
	method definirControles(){
		keyboard.n().onPressDo {game.say(cursor,cursor.heroeElegido().saludo())}
		keyboard.r().onPressDo {cursor.reforzarHeroe() }
		keyboard.a().onPressDo {wakanda.esAtacada(cursor.heroeElegido())}
		keyboard.s().onPressDo {wakanda.situacion()}
		keyboard.num(1).onPressDo { capitanAmerica.cambiarEscudo(escudito)}
		keyboard.num(2).onPressDo { capitanAmerica.cambiarEscudo(escudoSimple)}
		//keyboard.num(3).onPressDo { capitanAmerica.cambiarEscudo(cacerola)}
	}
}
