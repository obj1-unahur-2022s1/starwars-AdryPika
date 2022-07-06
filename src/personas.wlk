import planetas.*

class Personas {
	const property edad
	var  property potencia = 20
	
	method inteligencia(){
		if (self.edad().between(20,40)){return 12}
		else {return 8}
	}
	
	method esDestacada() {
		return self.edad() == 25 || self.edad() == 35
	} 
	method ofrecerTributo()  {}
	
	method valor() = self.potencia() + self.inteligencia()
}



class Atletas inherits Personas{
	var property  cantTecnicasConoce = 2
	var property masaMuscular = 4
	
	override method potencia() {
		return super() + self.masaMuscular()*self.cantTecnicasConoce()}
	override method esDestacada(){
		return super() || self.cantTecnicasConoce()>5
	}
	
	method entrenar(cantDias) = self.masaMuscular() + cantDias * 0.2
	method aprenderTecnica() = self.cantTecnicasConoce() + 1
	//override method ofrecerTributo() = construirMurallas(2) 

}



class Docentes inherits Personas{
	var property cursosQueDio 
	
	override method inteligencia() = super() + self.cursosQueDio()*2
	override method esDestacada() = self.cursosQueDio()>3
	override method valor() = super() + 5
	
	//override method ofrecerTributo() = fundarUnMuseo()
	
	
		
}