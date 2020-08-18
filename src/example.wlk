/** First Wollok example */
object escudoSimple{
	var poder = 10
	
	method poder(){
		return poder
	}
	method empoderar(){
		//asdfasdfasdf
	}
	// otros metodos
}

object escudito{
	method poder() {
		return 1
	}	
}

object cacerola{
	method cocinar(){
		
	}
	method reclamarPorlacuarentea() {}
	
	method poder() { return 20}
}



object capitanAmerica {
	var escudo = escudoSimple
	
	method cambiarEscudo(nuevo)	{
		escudo = nuevo
	}
	
	method fuerza()	{
		return escudo.poder() * 2
	}
}

object ironMan {
	var traje = false
	
	method volar(){
		traje = true
	}
		
	method fuerza(){
		return if(traje) 100 else 50
	}
}


object hulk {

	var fuerza = 20

	method transformarse(){
		fuerza = fuerza + 80
	}
	
	method fuerza(){
		return fuerza	
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
