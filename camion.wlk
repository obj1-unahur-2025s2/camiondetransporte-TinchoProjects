object camion {
    const cargaDelCamion = []

    method cargarCamion(unaCosa){
        cargaDelCamion.add(unaCosa)
    }

    method decargarCamion(unaCosa){
        cargaDelCamion.remove(unaCosa)
    }

    method pesoTotal() = 1000 + cargaDelCamion.sum({c => c.peso()})

    method pesosPares() = cargaDelCamion.all{c => c.peso() % 2 == 0}

    method cosaCargadaDePeso(unValor) = cargaDelCamion.any({c => c.peso() == unValor})

//Para un mejor control del tipo de peligro que puede representar la carga, se debe poder obtener la primer cosa cargada que tenga un determinado nivel de peligrosidad
    method primerCosaPeligrosidad(unValor) = cargaDelCamion.first({self.cosasDePeligrosidad(unValor)})

//Para facilitar los controles, también nos piden que se pueda consultar la lista de cosas que superan el nivel de peligrosidad de una cosa dada.
    method cosasDePeligrosidad(unValor) = cargaDelCamion.filter({c => c.peligrosidad() >= unValor})

//Para facilitar los controles, también nos piden que se pueda consultar la lista de cosas que superan el nivel de peligrosidad de una cosa dada.
    method peligrosidadIgualA(unaCosa) = cargaDelCamion.filter({c => c.peligrosidad() >= unaCosa.peligrosidad()})

    method excesoDePeso() = self.pesoTotal() > 2500

    method cosaCargadaDePeligrosidad(unValor) = cargaDelCamion.any({c => c.peligrosidad() == unValor})

    method habilitadoParaCircular(viajeActual) = self.cosaCargadaDePeligrosidad(viajeActual.peligrosidadPermitida()) && !self.excesoDePeso()
}