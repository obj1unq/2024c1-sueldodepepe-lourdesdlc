object pepe {
	var faltas = 0
	var categoria = cadete
	var bonoPresentismo = presentismoNulo
	var bonoResultado = resultadoNulo
	 
	method bonoResultado(_bonoResultado){
		bonoResultado = _bonoResultado
	} 
	method bonoPresentismo(_bonoPresentismo) {
		bonoPresentismo = _bonoPresentismo
	}
	method faltas (_faltas) {
		faltas = _faltas
	}
	method faltas(){
		return faltas
	}
	method categoria(_categoria){
		categoria = _categoria
	}
	method sueldo(){
		return self.neto() 
		+ self.resultado() 
		+ self.presentismo()
	}
	method categoria(){
		return categoria
	}
	method resultado(){
		return bonoResultado.valor(self)
	}
	method presentismo(){
		return bonoPresentismo.valor(self)
	}
	method neto(){
		return categoria.neto()
	}
}
//categoria
object gerente {
	
	method neto(){
		return 15000
	}
}
object cadete {
	
	method neto(){
		return 20000
	}
}
object vendedor {
	const neto = 16000
	var muchasVentas = false

	method neto() {
		return if (muchasVentas) {
			neto * 1.25
		} else {
			neto
		}
	}
	method activaAumentoPorMuchasVentas() {
		muchasVentas = true
	}

	method desactivaAumentoPorMuchasVentas() {
		muchasVentas = false
	}
}
object medioTiempo {
	var categoriaBase
			
	method neto(){
		return categoriaBase.neto() / 2
	}
	method categoriaBase(_categoriaBase){
		categoriaBase = _categoriaBase
	}
}
//Bono resultado
object porcentual {
	
	method valor(empleado){
		return empleado.neto() * 0.10
	}
}
object montoFijo {
	
	method valor(empleado){
		return 800
	} 
}
object resultadoNulo {
	
	method valor(empleado){
		return 0
	}
}
//Bono presentismo
object normal {
	
	method valor(empleado){
		return if (empleado.faltas() == 0){2000}
			else if(empleado.faltas() == 1){1000}
			else{0}
	}
}
object ajuste {
	
	method valor(empleado) {
		return if (empleado.faltas() == 0){100} else {0}
	}
}
object demagogico {
	
	method valor(empleado) {
		return if (empleado.neto() < 18000){500}else{300}
	}	
}
object presentismoNulo {
	
	method valor(empleado) {
		return 0
	}
}
object sofia {
	var bonoResultado = resultadoNulo
	var categoria 
	
	method bonoResultado(_bonoResultado){
		bonoResultado = _bonoResultado
	}
	method categoria(_categoria){
		categoria = _categoria
	}
	method sueldo(){
		return self.neto() + self.resultado()	
	}
	method resultado(){
		return bonoResultado.valor(self)
	}
	method neto(){
		return categoria.neto() * 1.3
	}
	method categoria(){
		return categoria
	}
}
object roque {
	var bonoResultado = resultadoNulo
	
	method bonoResultado(_bonoResultado){
		bonoResultado = _bonoResultado
	}
	method sueldo(){
		return self.neto() +  self.resultado()	+ 9000
	}
	method resultado(){
		return bonoResultado.valor(self)
	}
	method neto(){
		return 28000
	}
}
object ernesto {
	var companiero
	var bonoPresentismo = presentismoNulo
	
	method companiero(_companiero){
		companiero = _companiero
	}
	method sueldo(){
		return self.neto() + self.presentismo()
	}
	method neto(){
		return companiero.neto()
	}
	method bonoPresentismo(_bonoPresentismo) {
		bonoPresentismo = _bonoPresentismo
	}
	method presentismo(){
		return bonoPresentismo.valor(self)
	}
	method faltas(){
		return 0
	}
}