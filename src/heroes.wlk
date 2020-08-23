import wollok.game.*
import Armas.*

//------------------ Player (Protagonista) --------------//
object personaje{
	var property image = "imagenes/personaje.png"
	var property position = game.at(5,5)
	var property heroeElegido = null
	
	method seleccionarHeroe(nuevoHeroe){
		heroeElegido = nuevoHeroe
	}
	
	method transformarme(){
		if(self.puedoTransformarme()){
			image = heroeElegido.imagenHeroe()
			heroeElegido.reforzarse()
		}
		else
			game.say(self,"Seleccione un personaje primero")
	}
	
	method equiparArma(arma){
		//Habria que controlar que ya se haya elegido al heroe
		heroeElegido.equiparArma(arma)
		image = heroeElegido.imagenHeroe()
	}
	
	method puedoTransformarme() = heroeElegido != null
}

//---------------- Seleccionador de Heroes ----------//
object tonyStark{
	var property image = "imagenes/tonyStark.jpg"
	var property position = game.at(12,0)
	
	method colisionar(protagonista){
		protagonista.seleccionarHeroe(ironMan)
		protagonista.image(self.image())
	}	
}

object stevenRogers {
	var property image = "imagenes/stevenRogers.jpg"
	var property position = game.at(14,0)		

	method colisionar(protagonista){
		protagonista.seleccionarHeroe(capitanAmerica)
		protagonista.image(self.image())
	}
}

object diosDelTrueno {
	var property image = "imagenes/diosDelTrueno.jpg"
	var property position = game.at(16,0)
	
	method colisionar(protagonista){
		protagonista.seleccionarHeroe(thor)
		protagonista.image(self.image())
	}			
}

object bruceBunner{
	var property image = "imagenes/bruceBunner.jpg"
	var property position = game.at(18,0)				

	method colisionar(protagonista){
		protagonista.seleccionarHeroe(hulk)
		protagonista.image(self.image())
	}
}

//------------- Heroes ------------------------ //

object capitanAmerica {
	var property imagenHeroe = "imagenes/CAsinEscudo.jpg"
	const imagenConEscudo = "imagenes/CAconEscudo.png"
	var escudo = escudoSimple
	var incrementoPorTraje = 2
	
	method equiparArma(arma){
		self.cambiarEscudo(arma)
	}
	
	method cambiarEscudo(nuevo)	{
		imagenHeroe = imagenConEscudo
		escudo = nuevo
	}
	
	method fuerza()	{
		return escudo.poder() * incrementoPorTraje
	}
	method reforzarse() {
		incrementoPorTraje = 4
	}
	
	method nombre() = "Steven Rogers"
}

object ironMan {
	var traje = false
	
	var property imagenHeroe = "imagenes/ironConTraje.png"
	
	method reforzarse(){
		traje = true
	}
		
	method fuerza(){
		return if(traje) 100 else 50
	}
	
	method equiparArma(arma){
		
	}
	
	method nombre() = "Tony Stark"
}

object hulk {

	var fuerza = 20

	var property imagenHeroe = "imagenes/hulkTransformado.png"

	method transformarse(){
		fuerza = fuerza + 80
	}
	
	method fuerza(){
		return fuerza	
	}
	
	method reforzarse() {
		self.transformarse()
	}
	
	method nombre() = "Bruce Banner"
}

object thor{
	var property imagenHeroe = "imagenes/ThorSinMartillo.jpg"
	const imagenConMartillo = "imagenes/thorConMartillo.jpg"
	var martillo
	var tieneMartillo = false
	var fuerza = 0
	
	method equiparArma(nuevaArma){
		martillo = nuevaArma
		tieneMartillo = true
		imagenHeroe = imagenConMartillo
	}
	
	method reforzarse(){
		fuerza = 20
	}
	
	method fuerza(){
		return fuerza + self.poderExtra()
	}
	
	method poderExtra(){
		return if(tieneMartillo) martillo.poder() else 0
	}
	
	method nombre() = "El dios del trueno"
}

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
	
	method nombre() = "Peter Parker"
	
	method equiparArma(){
		
	}
}