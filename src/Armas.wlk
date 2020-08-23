import wollok.game.*
import heroes.*

object colisionArmas{
	
	method ejecutarColision(protagonista,arma){
		if(arma.personajePuedeUsar(protagonista.heroeElegido())){
			protagonista.equiparArma(arma)
			game.say(arma,arma.mensajeCorrecto())
		}else{
			game.say(arma,arma.mensajeIncorrecto())
		}
	}	
}

// -------------- Armas de los vengadores ----------------------- //
object escudoSimple{
	const poder = 10
	var property image = "imagenes/escudoSimple.png"
	var property position = game.at(0,0)
	
	method poder(){
		return poder
	}
	method empoderar(){
		//
	}
	
	method colisionar(protagonista){
		colisionArmas.ejecutarColision(protagonista, self)
	}
	
	method personajePuedeUsar(protagonista){
		return protagonista == capitanAmerica
	}
	
	method mensajeCorrecto() = "Hola Capitan America"
	
	method mensajeIncorrecto() = "No sos el Capitan America Bye"
}

object escudito{
	var property image = "imagenes/escudito.png"
	var property position = game.at(2,0)
	
	method poder() {
		return 1
	}
	
	method colisionar(protagonista){
		colisionArmas.ejecutarColision(protagonista, self)
	}	
	
	method personajePuedeUsar(protagonista){
		return false
	}

	method mensajeCorrecto() = "No soy gran cosa, pero te protejo"
	
	method mensajeIncorrecto() = "Una lastima que no me puedas usar" 

}

object martilloThor{
	var property image = "imagenes/martilloThor.png"
	var property position = game.at(4,0)
	
	method poder() {
		return 100
	}
	
	method colisionar(protagonista){
		colisionArmas.ejecutarColision(protagonista, self)
	}
	
	method personajePuedeUsar(protagonista){
		return protagonista == thor
	}

	method mensajeCorrecto() = "Pudiste levantarme, mis respetos"
	
	method mensajeIncorrecto() = "No sos capaz de levantarme" 

}

object cacerola{
	var property image = "imagenes/cacerola.png"
	var property position = game.at(6,0)	
	
	method cocinar(){
	}
	
	method reclamarPorlacuarentea() {}
	
	method poder() = 20

	method colisionar(protagonista){
		colisionArmas.ejecutarColision(protagonista, self)
	}

	method personajePuedeUsar(protagonista){
		return false
	}

	method mensajeCorrecto() = "Vamos al obelisco"
	
	method mensajeIncorrecto() = "No sos revolucionario" 
}