/** First Wollok example */
object capitanAmerica{
	
	method usarEscudo(){
		
	}
	
	method fuerza(){
		
	}
}


object ironMan {
	
	method volar(){
		
	}
	method fuerza(){
		
	}
}

object hulk {

	method transformarse(){
		
	}
	method fuerza(){
		
	}

}


object wakanda {
	
	var heroe = hulk
	var amenaza = 0
	
	method recibirAmenaza(){
		amenaza = amenaza + 1
	}
	
	method estaEnPeligro(){
		return heroe.fuerza() < amenaza 
	}
	
	method heroe(nuevo){
		heroe = nuevo
	}
	
}


// Thanos
