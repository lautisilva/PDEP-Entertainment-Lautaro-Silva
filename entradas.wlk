import productora.*

class Entrada {
    const property banda 
    const property fecha
    const precioBase = 1000

    method nombreBanda() = banda.nombre()

    method precioAlPublico() = precioBase +(precioBase * productora.impuesto())
}

// entrada calcula su precio al publico ya que es su responsabilidad, al igual que no tiene un atributo impuesto, sino que se lo pide a la productora.
