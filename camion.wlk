import cosas.*
object camion {

//Se pide que se le pueda cargar y descargar cosas (de 1 a vez) y también cual es el peso total del camión, incluyendo su tara que es de 1000 kg.
    const cargaDelCamion = []

    method cargarCamion(unaCosa){
        cargaDelCamion.add(unaCosa)
    }

    method decargarCamion(unaCosa){
        cargaDelCamion.remove(unaCosa)
    }

    method peso() = 1000 + cargaDelCamion.sum({c => c.peso()})

//También se necesita conocer si los pesos de todas las cosas cargadas en el camión son números pares.
    method pesosPares() = cargaDelCamion.all{c => c.peso() % 2 == 0}

//Debemos poder consultar si hay alguna cosa que pesa un determinado valor.
    method cosaCargadaDePeso(unValor) = cargaDelCamion.any({c => c.peso() == unValor})

//Para un mejor control del tipo de peligro que puede representar la carga, se debe poder obtener la primer cosa cargada que tenga un determinado nivel de peligrosidad
    method primerCosaPeligrosidad(unValor) = cargaDelCamion.first({self.cosasDePeligrosidad(unValor)})

    method cosasDePeligrosidad(unValor) = cargaDelCamion.filter({c => c.peligrosidad() == unValor})

//Obtener todas las cosas que superan un determinado nivel de peligrosidad.
    method cosasDeMayorPeligrosidad(unValor) = cargaDelCamion.filter({c => c.peligrosidad() >= unValor})

//Para facilitar los controles, también nos piden que se pueda consultar la lista de cosas que superan el nivel de peligrosidad de una cosa dada.
    method cosasDepeligrosidadIgualA(unaCosa) = cargaDelCamion.filter({c => c.peligrosidad() >= unaCosa.peligrosidad()})

//Conocer si el camión está excedido del peso máximo permitido,que es de 2500 kg.
    method excesoDePeso() = self.peso() > 2500

//Saber si el camión puede circular en ruta. Eso depende de que no exceda el peso máximo permitido y ninguno de los objetos cargados supere un nivel máximo de peligrosidad que depende del viaje, por eso para este caso el valor del nivel se pasará como argumento.
    method habilitadoParaCircular(viajeActual) = !self.cosaCargadaDeMayorPeligrosidad(viajeActual.peligrosidadPermitida()) && !self.excesoDePeso()


    method cosaCargadaDeMayorPeligrosidad(unValor) = cargaDelCamion.any({c => c.peligrosidad() >= unValor})

}

//Destinos
object caBa {
    method peligrosidadPermitida() = 5
}

object ituzaingo {
    method peligrosidadPermitida() = 2
}

object castelar {
    method peligrosidadPermitida() = 3
}

object moreno {
    method peligrosidadPermitida() = 8
}