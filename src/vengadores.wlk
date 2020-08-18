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
	method reforzarse() {
		self.cambiarEscudo(cacerola)
		
	}
}

object ironMan {
	var traje = false
	
	method reforzarse(){
		traje = true
	}
		
	method fuerza(){
		return if(traje) 100 else 50
	}
}

object spiderMan{
	
	method fuerza() {
		return 1
	}
	
	method reforzarse() {
		// no hace nada
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
	
	method reforzarse() {
		self.transformarse()
	}
}


object wakanda {
	var poderEjercito=1000

	var heroe = hulk
	var amenaza = 0
	
	method recibirAmenaza(){
		amenaza = amenaza + 1
	}
	
	method heroe() {
		return heroe
	}
	
	method amenaza() {
		return amenaza
	}
	
	method estaEnPeligro(){
		return heroe.fuerza() < amenaza 
	}
	
	method heroe(nuevo){
		heroe = nuevo
	}
	
	
	method esAtacada(villano){
		amenaza += villano.fuerza()
		poderEjercito -= villano.fuerza()
		heroe.reforzarse()
		if(self.estaEnPeligro()){
			heroe = villano
			amenaza += villano.fuerza()
		}
		else {
			amenaza -= villano.fuerza()
		}
	}
	method esRey(personaje) {
		return heroe == personaje 
	}
	method poderEjercito(){
		return poderEjercito
	}

}
	

object drDoom{
	const nivelAmenaza = 150
	
	method fuerza(){
		return nivelAmenaza
	}
	
}

object antman{
	var modoCuantico = false
	
	method pasarModoCuantico(){
		modoCuantico = true
	}
	method volverModoNormal()
	{
		modoCuantico = false
	}
	method fuerza(){
		return if(modoCuantico) 1 else 40
	}
	method reforzarse(){
		self.pasarModoCuantico()
	}
}	

	
object panteraNegra{
	var fuerza=40
	method poderDelRey(){
		if(wakanda.esRey(self)){
			fuerza= 40 + wakanda.poderEjercito()
		}
	}
	method fuerza() {
		return fuerza
	}
	
	method reforzarse(){
		self.poderDelRey()
	}
}
// Thanos
