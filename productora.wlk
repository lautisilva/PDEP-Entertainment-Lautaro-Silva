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

/*
La productora arma los reportes delegando en los demas, ya que hay cosas que no son su responsabilidad. Por ejemplo, entradasVendidasPara(banda) 
no recorre las entradas de cada asistente, sino que le pide a cada uno que lo haga. Así la productora no necesita conocer la estructura interna del asistente.
La productora no guarda las entradas vendidas ya que estan en el historial de cada asistente. Si la productora tuviera su propia lista, cada compra tendria que
registrarse en dos lugares, con el riesgo de que no coincidan
*/