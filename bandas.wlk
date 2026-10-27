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

/*
Uso clases ya que hay objetos con el mismo comportamiento pero estado propio. Tambien se usa superclase para que los distintos tipos de bandas hereden
de la superclase Banda. Todas las bandas comparten nombre, canon base y la forma de calcular el presupuesto. Ademas de los metodos abstractos popularidad y gastoExtra
que son definidos en cada subclase.

Defini el presupuesto una vez sola en banda ya que presupuesto() es igual para todas las bandas: canon mas gasto extra.
Lo que cambia segun el tipo es cómo se calcula cada parte, asi que cada subclase redefine solo eso usando override. Ademas, BandaDeTrap redefine canon() usando super(),
porque su canon parte del canon general y lo multiplica por la popularidad.
*/