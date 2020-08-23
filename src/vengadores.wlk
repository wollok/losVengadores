/** First Wollok example */
import wollok.game.*
import Armas.*
import heroes.*

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
	method esRey(personajeActual) {
		return heroe == personajeActual 
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
