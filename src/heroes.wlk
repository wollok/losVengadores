import wollok.game.*
import Armas.*

//------------------ Cursor (Protagonista) --------------//
object cursor{
	const imagenSinHeroe = "personaje.png"
	
	var property position = game.center()
	var property heroeElegido = null
	
	
	method image() {
		if (self.sinHeroe()) {
			return imagenSinHeroe 
		}
		return heroeElegido.image()
	} 
	
	method sinHeroe() {
		return heroeElegido == null
	}
	method seleccionarHeroe(nuevoHeroe){
		heroeElegido = nuevoHeroe
	}
	
	method reforzarHeroe(){
		if(self.sinHeroe())
			game.say(self,"Seleccione un personaje primero")
		else
			heroeElegido.reforzarse()
	}

}


//------------- Heroes ------------------------ //

object capitanAmerica {

	var escudo = escudoSimple
	var incrementoPorTraje = 2

	method position() = game.at(14,0)		
	method image() = "CA" + escudo.desc() + "Escudo." + escudo.ext()
	
	method cambiarEscudo(nuevo)	{
		escudo = nuevo
	}
	
	method fuerza()	{
		return escudo.poder() * incrementoPorTraje
	}
	method reforzarse() {
		incrementoPorTraje = 4
	}
	
	method saludo() = "Steven Rogers"

}


object hulk {

	var fuerza = 20
	var image = "bruceBunner.jpg"
	
	method position() = game.at(10,0)
	method image() = image 

	method transformarse(){
		fuerza = fuerza + 80
		image = "hulkTransformado.png" 
	}
	
	method fuerza() = fuerza	
	
	method reforzarse() {
		self.transformarse()
	}
	
	method saludo() = "Bruce !!!!"
}






object ironMan {
	var traje = false
	
	method position() = game.at(12,0)
	method image() = if(traje) "ironConTraje.png" else "tonyStark.jpg"
	method reforzarse(){ traje = not traje }
	method fuerza() = if(traje) 100 else 50
	method saludo() = "Soy Tony Stark"
}


object thor{

	var fuerza = 0
	var position = game.at(16,0)
	
	method position() = position

	method image()  = "Thor" + (if(martilloThor.activo()) "Con" else "Sin") + "Martillo.jpg"
	
	method reforzarse(){
		fuerza += 20
		martilloThor.activar()
		position = game.at(position.x(),0.randomUpTo(game.height()).truncate(0))
	}
	
	method fuerza(){
		return fuerza + martilloThor.poder()
	}
	
	method saludo() = "El dios del trueno"
}

object martilloThor{
	var activo = false
	method image() = "martilloThor.png"
	method position() = thor.position().right(2)
	method poder() =  if (activo) 1000 else 0
	
	method activar() {
		if(!activo){
			game.addVisual(self)
			activo = true
		}
	}

	method activo() = activo
	
}


object wakanda {

	var heroe = hulk
	var amenaza = 0

	method image() = "wakanda.png" 
	method position() = game.at(0,10)

	
	method recibirAmenaza(){
		amenaza = amenaza + 1
	}
	
	method heroe() {
		return heroe
	}
	
	method amenaza() {
		return amenaza
	}
	
	method situacion() {
		game.say(self, "Me defiende " + heroe.saludo() + "Amenaza: " + amenaza.toString() )
	}
	
	method estaEnPeligro(){
		return heroe.fuerza() < amenaza 
	}
	
	method heroe(nuevo){
		heroe = nuevo
	}
	
	
	method esAtacada(villano){
		amenaza += villano.fuerza()
		game.say(villano, "ataco con" + villano.fuerza().toString())
		heroe.reforzarse()
		game.say(heroe, "ahora tengo mas fuerza: " + heroe.fuerza().toString())
		if(self.estaEnPeligro()){
			game.removeVisual(heroe)
			heroe = villano
			amenaza += villano.fuerza()
		}
		else {
			amenaza -= villano.fuerza()
		}
	}

}


// OTROS
object spiderMan{
	
	var modoVenom = false
	
	method fuerza() {
		return if(modoVenom) 100 else 1
	}
	
	method equiparArma(arma){
		
	}
	
	method reforzarse() {
		modoVenom = true
	}
	
	method saludo() = "Peter Parker"
	
	method equiparArma(){
		
	}
}