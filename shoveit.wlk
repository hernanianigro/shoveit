import wollok.game.*
import niveles.*

class Caja {
	var property position
	const property llegadas
	method movete(direccion) {
		self.validarLugarLibre(direccion)
		position = direccion.siguiente(position)
	}
	method validarLugarLibre(direccion) {
		const posAlLado = direccion.siguiente(position)
		const lugarLibre = game.getObjectsIn(posAlLado).all(
			{ obj => obj.puedePisarte(self) }
		)
		if (!lugarLibre) {
			throw new DomainException(message = "Algo traba la caja.", source = shoveit)
		}
	}
	method puedePisarte(_) = false
	method image() = if (self.estaBienPosicionada()) "box_ok.png" else "box.png"
	method estaBienPosicionada() = llegadas.any({ llegada => llegada.position() == position })
}

object shoveit {
	var property position = game.at(4, 8)
	method image ()= "" + direccion.image()
	var property direccion = abajo
	method empuja(unElemento) {
		try
			unElemento.movete(direccion)
		catch e {
			self.retrocede()
			throw e
		}
	}
	method retrocede() {
		position = direccion.opuesto().siguiente(position)
	}
	method retrocedeCon(caja) {
		self.retrocede()
		caja.movete(direccion.opuesto())
	}
	method irArriba() {
		direccion = arriba
		self.avanzar()
	}
	method irAbajo() {
		direccion = abajo
		self.avanzar()
	}
	method irIzquierda() {
		direccion = izquierda
		self.avanzar()
	}
	method irDerecha() {
		direccion = derecha
		self.avanzar()
	}
	method avanzar() {
		position = direccion.siguiente(position)
	}
	method setDireccion(unaDireccion) {
		direccion = unaDireccion
	}
}


class Direccion {
	method siguiente(position)
}

object izquierda inherits Direccion { 
	override method siguiente(position) = position.left(1) 
	method opuesto() = derecha
	method image() {
		return "jugadorIzquierda.png"
	}
}

object derecha inherits Direccion { 
	override method siguiente(position) = position.right(1) 
	method opuesto() = izquierda
	method image() {
		return "jugadorDerecha.png"
	}
}

object abajo inherits Direccion { 
	override method siguiente(position) = position.down(1) 
	method opuesto() = arriba
	method image() {
		return "jugadorAbajo.png"
	}
}

object arriba inherits Direccion { 
	override method siguiente(position) = position.up(1) 
	method opuesto() = abajo
	method image() {
		return "jugadorArriba.png"
	}
}

class Llegada {
	const property position
	// No pasa naranja cuando se quiere mover
	method movete(direccion) { }
	method puedePisarte(_) = true
	method image() = "floor2.png"
}

class Pared {
	var property position
	method movete(direccion) {
		throw new DomainException(message = "No puedes mover las paredes.", source = shoveit)
	}
	method puedePisarte(_) = false
	method image() = "wall.png"
}

object squish {
  method play(){
    game.sound("squish.mp3").play()
  }
}