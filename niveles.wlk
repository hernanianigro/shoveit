import wollok.game.*
import shoveit.*

object nivel1 {
	method cargar() {
    	game.boardGround("pisoNivel1.png")
		//PAREDES
		const ancho = game.width() - 1
		const largo = game.height() - 1
		const posicionesParedes = []
		posicionesParedes.addAll(
			[
				new Position(x = 3, y = 9),
				new Position(x = 4, y = 9),
				new Position(x = 5, y = 9),
				new Position(x = 6, y = 9),
				new Position(x = 7, y = 9),
				new Position(x = 3, y = 8),
				new Position(x = 7, y = 8),
				new Position(x = 3, y = 7),
				new Position(x = 7, y = 7),
				new Position(x = 9, y = 7),
				new Position(x = 10, y = 7),
				new Position(x = 11, y = 7),
				new Position(x = 3, y = 6),
				new Position(x = 7, y = 6),
				new Position(x = 9, y = 6),
				new Position(x = 11, y = 6),
				new Position(x = 3, y = 5),
				new Position(x = 4, y = 5),
				new Position(x = 5, y = 5),
				new Position(x = 7, y = 5),
				new Position(x = 8, y = 5),
				new Position(x = 9, y = 5),
				new Position(x = 11, y = 5),
				new Position(x = 4, y = 4),
				new Position(x = 5, y = 4),
				new Position(x = 11, y = 4),
				new Position(x = 4, y = 3),
				new Position(x = 8, y = 3),
				new Position(x = 11, y = 3),
				new Position(x = 4, y = 2),
				new Position(x = 8, y = 2),
				new Position(x = 9, y = 2),
				new Position(x = 10, y = 2),
				new Position(x = 11, y = 2),
				new Position(x = 4, y = 1),
				new Position(x = 5, y = 1),
				new Position(x = 6, y = 1),
				new Position(x = 7, y = 1),
				new Position(x = 8, y = 1)
			]
		)
		posicionesParedes.forEach({ posicionParedes => self.dibujar(new Pared(position = posicionParedes)) })
		//LLEGADAS
		const llegadas = [
			new Position(x = 10, y = 6),
			new Position(x = 10, y = 5),
			new Position(x = 10, y = 4)
		].map({ posicion => self.dibujar(new Llegada(position = posicion)) }) 
        //CAJAS
		const cajas = [
			new Position(x = 5, y = 6),
			new Position(x = 5, y = 7),
			new Position(x = 6, y = 7)
		].map({ posicion => self.dibujar(new Caja(position = posicion, llegadas = llegadas)) })
		//shoveit
		game.addVisual(shoveit)
        //TECLADO
		keyboard.up().onPressDo({ shoveit.irArriba() })({squish.play()})
		keyboard.down().onPressDo({ shoveit.irAbajo() })({squish.play()})
		keyboard.left().onPressDo({ shoveit.irIzquierda() })({squish.play()})
		keyboard.right().onPressDo({ shoveit.irDerecha() })({squish.play()})
		keyboard.r().onPressDo({ self.restart() })
		//COLISIONES.onPressDo({ self.comprobarSiGano(cajas) })
		game.whenCollideDo(shoveit, { elemento => shoveit.empuja(elemento) })
	}
	method restart() {
		game.clear()
		self.cargar()
	}
	method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
	method comprobarSiGano(cajas) {
		if (cajas.all({ caja => caja.estaBienPosicionada() }))
			game.say(shoveit, "GANASTE!")
			game.onTick(5000, "gameEnd", { game.stop() })
	}
}

object nivel2 {
	method cargar() {
    	game.boardGround("floorNivel2.png")
		//PAREDES
		const ancho = game.width() - 1
		const largo = game.height() - 1
		const posicionesParedes = []
		posicionesParedes.addAll(
			[
				new Position(x = 6, y = 1),
				new Position(x = 7, y = 1),
				new Position(x = 8, y = 1),
				new Position(x = 6, y = 2),
				new Position(x = 8, y = 2),
				new Position(x = 3, y = 3),
				new Position(x = 4, y = 3),
				new Position(x = 5, y = 3),
				new Position(x = 6, y = 3),
				new Position(x = 8, y = 3),
				new Position(x = 3, y = 4),
				new Position(x = 8, y = 4),
				new Position(x = 9, y = 4),
				new Position(x = 10, y = 4),
				new Position(x = 3, y = 5),
				new Position(x = 4, y = 5),
				new Position(x = 5, y = 5),
				new Position(x = 10, y = 5),
				new Position(x = 5, y = 6),
				new Position(x = 7, y = 6),
				new Position(x = 8, y = 6),
				new Position(x = 9, y = 6),
				new Position(x = 10, y = 6),
				new Position(x = 5, y = 7),
				new Position(x = 7, y = 7),
				new Position(x = 5, y = 8),
				new Position(x = 6, y = 8),
				new Position(x = 7, y = 8)
			]
		)
		posicionesParedes.forEach({ posicionParedes => self.dibujar(new Pared(position = posicionParedes)) })
		//LLEGADAS
		const llegadas = [
			new Position(x = 7, y = 2),
			new Position(x = 4, y = 4),
			new Position(x = 9, y = 5),
			new Position(x = 6, y = 7)
		].map({ posicion => self.dibujar(new Llegada(position = posicion)) }) 
        //CAJAS
		const cajas = [
			new Position(x = 6, y = 5),
			new Position(x = 6, y = 4),
			new Position(x = 7, y = 3),
			new Position(x = 8, y = 5)
		].map({ posicion => self.dibujar(new Caja(position = posicion, llegadas = llegadas)) })
		//shoveit
		game.addVisual(shoveit)
        //TECLADO
		keyboard.up().onPressDo({ shoveit.irArriba() })({squish.play()})
		keyboard.down().onPressDo({ shoveit.irAbajo() })({squish.play()})
		keyboard.left().onPressDo({ shoveit.irIzquierda() })({squish.play()})
		keyboard.right().onPressDo({ shoveit.irDerecha() })({squish.play()})
		keyboard.r().onPressDo({ self.restart() })
		//COLISIONES.onPressDo({ self.comprobarSiGano(cajas) })
		game.whenCollideDo(shoveit, { elemento => shoveit.empuja(elemento) })
	}
	method restart() {
		game.clear()
		self.cargar()
	}
	method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
	method comprobarSiGano(cajas) {
		if (cajas.all({ caja => caja.estaBienPosicionada() }))
			game.say(shoveit, "GANASTE!")
			game.onTick(5000, "gameEnd", { game.stop() })
	}
}

object nivel3 {
	method cargar() {
		game.boardGround("floorNivel3.png")
		//PAREDES
		const ancho = game.width() - 1
		const largo = game.height() - 1
		const posicionesParedes = []
		posicionesParedes.addAll(
			[
				new Position(x = 5, y = 8),
				new Position(x = 6, y = 8),
				new Position(x = 7, y = 8),
				new Position(x = 8, y = 8),
				new Position(x = 4, y = 7),
				new Position(x = 5, y = 7),
				new Position(x = 8, y = 7),
				new Position(x = 4, y = 6),
				new Position(x = 8, y = 6),
				new Position(x = 4, y = 5),
				new Position(x = 5, y = 5),
				new Position(x = 8, y = 5),
				new Position(x = 9, y = 5),
				new Position(x = 4, y = 4),
				new Position(x = 5, y = 4),
				new Position(x = 9, y = 4),
				new Position(x = 4, y = 3),
				new Position(x = 9, y = 3),
				new Position(x = 4, y = 2),
				new Position(x = 9, y = 2),
				new Position(x = 4, y = 1),
				new Position(x = 5, y = 1),
				new Position(x = 6, y = 1),
				new Position(x = 7, y = 1),
				new Position(x = 8, y = 1),
				new Position(x = 9, y = 1)
			]
		)
		posicionesParedes.forEach({ posicionParedes => self.dibujar(new Pared(position = posicionParedes)) })
		//LLEGADAS
		const llegadas = [
			new Position(x = 5, y = 3),
			new Position(x = 5, y = 2),
			new Position(x = 6, y = 2),
			new Position(x = 7, y = 2),
			new Position(x = 8, y = 2)
		].map({ posicion => self.dibujar(new Llegada(position = posicion)) }) 
        //CAJAS
		const cajas = [
			new Position(x = 6, y = 6),
			new Position(x = 6, y = 5),
			new Position(x = 7, y = 4),
			new Position(x = 6, y = 3),
			new Position(x = 7, y = 2)
		].map({ posicion => self.dibujar(new Caja(position = posicion, llegadas = llegadas)) })
		//shoveit
		game.addVisual(shoveit)
        //TECLADO
		keyboard.up().onPressDo({ shoveit.irArriba() })({squish.play()})
		keyboard.down().onPressDo({ shoveit.irAbajo() })({squish.play()})
		keyboard.left().onPressDo({ shoveit.irIzquierda() })({squish.play()})
		keyboard.right().onPressDo({ shoveit.irDerecha() })({squish.play()})
		keyboard.r().onPressDo({ self.restart() })
		//COLISIONES.onPressDo({ self.comprobarSiGano(cajas) })
		game.whenCollideDo(shoveit, { elemento => shoveit.empuja(elemento) })
	}
	method restart() {
		game.clear()
		self.cargar()
	}
	method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}
	method comprobarSiGano(cajas) {
		if (cajas.all({ caja => caja.estaBienPosicionada() }))
			game.say(shoveit, "GANASTE!")
			game.onTick(5000, "gameEnd", { game.stop() })
	}
}