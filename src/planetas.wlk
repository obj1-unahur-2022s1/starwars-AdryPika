/*
 * Planeta:
 * 1) El enunciado pedía que la colección de habitantes del planeta sea un set y no un list.
 * 2) El método valorInicialDefensa() podía implementarse usando el mensaje count sobre la
 * colección de habitantes para evitar filtrar y luego sobre la subcolección pedir el size.
 * 3) El método construirMurallas(kms) no está bien implementado, ya que aparece como un getter
 * y en realidad debía modificar el valor de la longMurallas. Te dejo la corrección.
 * 4) El método fundarUnMuseo() no está bien implementado, ya que aparece como un getter
 * y en realidad debía modificar el valor de la cantMuseos. Te dejo la corrección.
 * 5) El método potenciaAparente() hubiese quedado mejor implementado con un método auxiliar, 
 * para que no quede tan extensa la expresión. Te dejo la sugerencia en el código. 
 * 6) El método recibirTributos() no está bien implementado. No se le puede enviar el
 * mensaje ofrecerTributo() a la coleccion de habitantes. Te dejo la forma correcta
 * de implementar ese método. 
 * 7) El método apaciguarOtroPlaneta(otroPlaneta) no está bien implementado. Por un lado es
 * incorrecto enviarle el mensaje habitantesValiosos() a la colección de habitantes, ya que ese
 * es un método de Planeta. Luego, usar el mensaje all sobre una colección, retorna verdadero o falso
 * según la condición dentro del closure, y no es lo que pedía el enunciado, sino que cada habitante
 * valioso rindiera tributo al otro planeta. Te dejo la forma correcta de implementar ese método.
 * 8) Faltan test para verificar el funcionamiento de los métodos.
 */

import personas.*

class Planeta{
	var property habitantes = #{} // se pedía que sea un set no un list
	var property cantMuseos = 0
	var property longMurallas = 0
	
	
	method delegacionDiplomatica() = habitantes.filter( {h => h.esDestacada() } )
	
	method valorInicialDefensa() = habitantes.count( { h => h.potencia() > 30 } )
	
	method esCulto() = cantMuseos >= 2 and habitantes.all( { h => h.inteligencia() >= 10 } )
	
	method potenciaReal() = habitantes.sum( { h => h.potencia() } )
	
	method construirMurallas(kms) { longMurallas += kms}
	
	method fundarUnMuseo() { cantMuseos++ }
	
	method maximaPotencia() = habitantes.max( { h => h.potencia() } ).potencia()
	method potenciaAparente() = self.maximaPotencia() * habitantes.size()
	
	method necesitaReforzar()= self.potenciaAparente() >= self.potenciaReal()*2
	
	method recibirTributos(){ habitantes.forEach { h=>h.ofrecerTributo(self) } }
	
	method habitantesValiosos() = habitantes.filter( { h => h.valor() >= 40 } )
	
	method 	apaciguarOtroPlaneta(otroPlaneta) = 
		self.habitantesValiosos().forEach{h=>h.ofrecerTributo(otroPlaneta)}
}

