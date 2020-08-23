import wollok.game.*
import vengadores.*
import heroes.*
import Armas.*

object losVengadoresGame {
	
	method jugar(){
		self.configurar()
		game.start();
	}
	
	method configurar(){
		self.configurarPantalla()
		self.configurarPersonaje()
		self.setearControles()
		self.setearHeroes()
		self.setearArmas()
		self.setearColisionesPersonaje()
	}
	
	method configurarPantalla(){
		game.title("Vengadores Game")
		game.width(20)
		game.height(13)
		game.boardGround("imagenes/fondoDeBatalla.jpg")
	}
	
	method configurarPersonaje(){
		game.addVisualCharacter(personaje)
	}
	
	method setearHeroes(){
		game.addVisual(tonyStark)
		game.addVisual(stevenRogers)
		game.addVisual(diosDelTrueno)
		game.addVisual(bruceBunner)
	}
	
	method setearArmas(){
		game.addVisual(escudito)
		game.addVisual(escudoSimple)
		game.addVisual(martilloThor)
		game.addVisual(cacerola)
	}
	
	method setearColisionesPersonaje(){
		game.whenCollideDo(personaje,{elemento => elemento.colisionar(personaje)})
	}
	
	method setearControles(){
		keyboard.n().onPressDo {game.say(personaje,personaje.heroeElegido().nombre())}
		keyboard.t().onPressDo { personaje.transformarme() }
	}
}
