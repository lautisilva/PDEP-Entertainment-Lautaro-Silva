import Exception

class Entrada {
    const property banda 
    const property fecha
    const precioBase = 1000

    method nombreBanda() = banda.nombre()

    method precioAlPublico() = precioBase +(precioBase * productora.impuesto())
}

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


class NoTieneSaldoSuficiente inherits Exception(message = "no tiene saldo suficiente"){}

object fan {
    const descuento = 0

    method precioFinal(precioBase) = precioBase

    method bonificar(){}
}

class Vip {
    var property descuento

    method precioFinal(precioBase) = precioBase * (1 - descuento)

    method bonificar() {
        descuento += 0.01
    }
}

class Banda{
    const property nombre

    method canon() = 1000000

    method gastoExtra()

    method presupuesto() = self.canon() + self.gastoExtra()

    method popularidad()
}

class BandaDeRock inherits Banda{
    var property solosDeGuitarra

    override method gastoExtra() = 10000

    override method popularidad() = 100 * solosDeGuitarra
}

class BandaDeTrap inherits Banda{
    var property tieneHielo

    override method gastoExtra() = 0
    override method popularidad(){
        if(tieneHielo){
            return 1000
        }
        return 0
    }

    override method canon() = super() * self.popularidad()
}

class BandaIndie inherits Banda{
    var property instrumentos

    override method popularidad() = 3.14 * nombre.size()

    override method gastoExtra() = 500 * instrumentos
}

object productora{
    var property impuesto = 0.5
    const asistentes = []
    const bandas = #{}

    method gananciaTotal() = (asistentes.sum({asistente => asistente.gastoTotal()})) - bandas.sum({banda => banda.presupuesto()})
        
    method bandaMasPopular() = bandas.max({banda => self.entradasVendidasPara(banda)})

    method entradasVendidasPara(banda) {
        return asistentes.sum({ asistente => asistente.entradasDeBanda(banda) })
    }

    method cantidadDeEntradasVendidas() = asistentes.sum({asistente => asistente.showsAsistidos()})

    method bonificarAsistentesVip() {
        asistentes.forEach({asistente => asistente.bonificarAbono()})
    }
}