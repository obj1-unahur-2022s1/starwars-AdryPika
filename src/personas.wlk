/*
 * Personas: 
 * 1) La potencia debía modelarse como un método y no como un atributo de 
 * la persona, ya que se calcula con información de otros atributos.
 * Atletas:
 * 2) El método entrenar(cantDias) no está bien implementado. Y de la forma que fue
 * escrito está como un getter en lugar de realizar la acción que pide el enunciado. Te dejo la corrección en el código.
 * 3) El método aprenderTecnica() no está bien implementado, ya que aparece como un getter
 * y en realidad debía modificar el valor de la cantTecnicasConoce. Te dejo la corrección.
 * Docentes:
 * 4) La variable cursosQueDio debía inicializarse en 0.
 * Soldados: 
 * 5) El método potenciaPorArma() no está bien implementado. No se le puede enviar el
 * mensaje potenciaQueOtorga(self) a la coleccion de armas. Te dejo la forma correcta
 * de implementar ese método auxiliar. 
 */

import planetas.*

class Personas {
	const property edad
	
	method potencia() = 20
	method inteligencia(){
		if (self.edad().between(20,40)){return 12}
		else {return 8}
	}
	
	method esDestacada() {
		return self.edad() == 25 || self.edad() == 35
	} 
	method ofrecerTributo(planeta){}
	
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
	
	method entrenar(cantDias) {	masaMuscular += cantDias.div(5) }
	
	method aprenderTecnica() { cantTecnicasConoce++ }
	
	override method ofrecerTributo(planeta) { planeta.construirMurallas(2)} 

}

class Docentes inherits Personas{
	var property cursosQueDio = 0 //debía ir inicializado en 0
	
	override method inteligencia() = super() + self.cursosQueDio()*2
	override method esDestacada() = self.cursosQueDio()>3
	override method valor() = super() + 5
	
	override method ofrecerTributo(planeta) {planeta.fundarUnMuseo()}
		
}


class Soldados inherits Personas{
	const property coleccionArmas = []
	
	override method potencia() = super() + self.potenciaPorArmas()
	
	method potenciaPorArmas() = coleccionArmas.sum{a=>a.potenciaQueOtorga(self)}
	
	override method ofrecerTributo(planeta) { planeta.construirMurallas(5)} 
	
}

class Pistolete{
	var property largoEnCm = 0
	
	method potenciaQueOtorga(soldado){
		if (soldado.edad()>30){return largoEnCm * 3}
		else{ return largoEnCm * 2}
	}
	
}


class Espadon{
	var property peso
	
	method potenciaQueOtorga(soldado){
		if (soldado.edad()<40){ return self.peso()*0.5}
		else{ return 6} 
	}
	
}
