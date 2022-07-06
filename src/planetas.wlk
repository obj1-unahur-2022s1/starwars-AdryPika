import personas.*

class Planeta{
	var property habitantes = []
	var property cantMuseos = 0
	var property longMurallas
	
	
	method delegacionDiplomatica() = habitantes.filter( {h => h.esDestacada() } )
	method valorInicialDefensa() = habitantes.filter( { h => h.potencia() > 30 } ).size()
	method esCulto() = cantMuseos >= 2 and habitantes.all( { h => h.inteligencia() >= 10 } )
	method potenciaReal() = habitantes.sum( { h => h.potencia() } )
	
	method construirMurallas(kms) = longMurallas + kms
	method fundarUnMuseo() = cantMuseos + 1
	method potenciaAparente()= habitantes.max( { h => h.potencia() } ).potencia() * habitantes.size()
	method necesitaReforzar()= self.potenciaAparente() >= self.potenciaReal()*2
	method recibirTributos() = 	habitantes.ofrecerTributo()
	method habitantesValiosos() = habitantes.filter( { h => h.valor() >= 40 } )
	method apaciguarOtroPlaneta(planeta, otroPlaneta) {
		return planeta.habitantesValiosos.all(  { o => o.ofrecerTributo(otroPlaneta) })}
}