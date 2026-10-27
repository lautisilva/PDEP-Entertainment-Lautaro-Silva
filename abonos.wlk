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

/*
El abono es un objeto aparte y no una subclase de Asistente, una alternativa era tener AsistenteFan y AsistenteVip (herencia) pero
elegi que el asistente tenga un tipoAbono (composicion) porque el abono es una característica del asistente,no lo que el asistente es.
Asi el abono se puede cambiar en tiempo de ejecucion  y la logica del descuento queda ahi.
Abono es una interfaz ya que fan y vip entienden los mismos mensajes (precioFinal y bonificar), pero no se escribe en el codigo en Wollok.

fan es un wko y Vip es una clase.
El abono fan tiene descuento = 0 para todos. Alcanza con un unico objeto compartido por todos los asistentes.
El vip, en cambio, tiene un descuento particular para cada asistente, como dice el enunciado, así que cada asistente vip necesita su propia instancia.

*/