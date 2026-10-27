import Exception

class NoTieneSaldoSuficiente inherits Exception(message = "no tiene saldo suficiente"){}

class Asistente {
    var property tipoAbono
    const historialEntradas = []
    var property dinero
    const fechaActual = new Date()
    
    method comprarEntrada(entrada){
        if (dinero <= 0) {
            throw new NoTieneSaldoSuficiente()
            }
            dinero -= tipoAbono.precioFinal(entrada.precioAlPublico())
            historialEntradas.add(entrada)     
    }

    method entradasAnioAnterior(){
        return historialEntradas.filter({entrada => entrada.fecha().year() == fechaActual.year() - 1})
    }

    method bandasVistas() = (historialEntradas.map({entrada => entrada.nombreBanda()})).asSet()

    method showsAsistidos() = historialEntradas.size()

    method gastoTotal() = historialEntradas.sum({entrada => entrada.precioAlPublico()})

    method entradasDeBanda(banda) = historialEntradas.count({ entrada => entrada.banda() == banda })

    method bonificarAbono() {
        tipoAbono.bonificar()
    }
}

/*
Si no hay saldo, se lanza una excepcion para notificar adecuadamente el error
Ademas, la validacion ocurre antes de modificar el estado, entonces si falla no se descuenta dinero ni se agrega la entrada.

Se usa polimorfismo al pedir tipoAbono.bonificar y tipoAbono.precioFinal sin saber si el tipoAbono es fan o vip y cada uno responde a su manera.

gastoTotal() suma precioAlPublico() y no lo que el asistente efectivamente pago, porque el enunciado aclara que el descuento de los vip lo cubren los sponsors.

En bandasVistas, si un asistente compró varias entradas para la misma banda, el nombre tiene que aparecer una sola vez. Por eso se convierte el resultado con asSet().
*/