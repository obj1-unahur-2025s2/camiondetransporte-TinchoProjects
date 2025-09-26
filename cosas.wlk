//Knight Rider: pesa 500 kilos y su nivel de peligrosidad es 10.
object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}
//Bumblebee: pesa 800 kilos y su nivel de peligrosidad es 15 si está transformado en auto o 30 si está como robot.
object bumblebee {
    var property peligrosidad = 15
    method peso() = 800
    method transformarEnAuto() {
        peligrosidad = 15
    } 
    method transformarEnRobot() {
        peligrosidad = 30
    }
}
//Paquete de ladrillos: cada ladrillo pesa 2 kilos, la cantidad de ladrillos que tiene puede variar. La peligrosidad es 2.
object paqueteDeLadrillos {
    var cantidad = 10
    method nuevaCantidad(unaCantidad){
        cantidad = unaCantidad
    }
    method peso() = cantidad * 2
    method peligrosidad() = 2
}
//Arena a granel: el peso es variable, la peligrosidad es 1.
object arenaAGranel{
    var cantidad = 10

    method nuevaCantidad(unaCantidad){
        cantidad = unaCantidad
    }
    method peso() = cantidad
    method peligrosidad() = 1
}
//Batería antiaérea : el peso es 300 kilos si está con los misiles o 200 en otro caso. En cuanto a la peligrosidad es 100 si está con los misiles y 0 en otro caso.
object bateriaAntiaerea {
    var property peso = 300
    var property peligrosidad = 100

    method cargarMisiles(){
        peso = 300
        peligrosidad = 100
    }

    method descargarMisiles(){
        peso = 200
        peligrosidad = 0
    }
}
//Contenedor portuario: un contenedor puede tener otras cosas adentro. El peso es 100 + la suma de todas las cosas que estén adentro. Es tan peligroso como el objeto más peligroso que contiene. Si está vacío, su peligrosidad es 0.
object contenedorPortuario {
    const cosas = []
    method peso() = 100 + cosas.sum({c => c.peso()})
    method peligrosidad() {
        return self.cosaMasPeligrosa().peligrosidad()
    }
    method cosaMasPeligrosa() {
        if (cosas.isEmpty()){
           return 0 
        } else {
            return cosas.max({c => c.peligrosidad()})
        }
    }
}

object residuosRadiactivos {
    method peso() =
    method peligrosidad() =
}

object embalajeDeSeguridad {
    method peso() =
    method peligrosidad() =
}