import wollok.game.*
import heroes.*

object escudero{
	
	method tomarEscudo(protagonista,arma){
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
	
	method image() = "escudoSimple.png"
	method position() = game.origin()
	
	method poder(){
		return poder
	}
	method empoderar(){
		//
	}
	
	method desc() = "sin"
	method ext() = "jpg"
	

	method personajePuedeUsar(protagonista){
		return protagonista == capitanAmerica
	}
	
	method mensajeCorrecto() = "Hola Capitan America"
	
	method mensajeIncorrecto() = "No sos el Capitan America Bye"
}

object escudito{
	method image() = "escudito.png"
	method position() = escudoSimple.position().right(2)
	
	method poder() {
		return 1
	}
	
	method personajePuedeUsar(protagonista){
		return false
	}

	method mensajeCorrecto() = "No soy gran cosa, pero te protejo"
	method mensajeIncorrecto() = "Una lastima que no me puedas usar"
	 
	method desc() = "con"
	method ext() = "png"
}



object cacerola{
	method image() = "cacerola.png"
	method position() = game.at(6,0)	
	
	method cocinar(){
	}
	
	method reclamarPorlacuarentea() {}
	method poder() = 20

	method personajePuedeUsar(protagonista){
		return false
	}

	method mensajeCorrecto() = "Vamos al obelisco"
	method mensajeIncorrecto() = "No sos revolucionario" 
}