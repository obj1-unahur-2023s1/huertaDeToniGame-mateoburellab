import wollok.game.*
import plantas.*

object toni {
	const property image = "toni.png"
	var property position = game.at(3, 3)
	const property sembradas = []
	const property cosechadas = []
	var property oro = 0
	
	method configuracion()
	{
		keyboard.up().onPressDo { self.mover(arriba) }
		keyboard.down().onPressDo { self.mover(abajo) }
		keyboard.left().onPressDo { self.mover(izquierda) }
		keyboard.right().onPressDo { self.mover(derecha) }
		
		keyboard.m().onPressDo { self.sembrar(new Maiz(position = self.position())) }
		keyboard.t().onPressDo { self.sembrar(new Trigo(position = self.position())) }
		keyboard.o().onPressDo { self.sembrar(new Tomaco(position = self.position())) }
		
		keyboard.r().onPressDo { self.regarActual() }
		keyboard.a().onPressDo { self.regarTodas() }
		
		keyboard.x().onPressDo { self.cosecharActual() }
		keyboard.c().onPressDo { self.cosecharTodas() }
		keyboard.space().onPressDo {game.say(self, self.mensajeOro()) }
	}
	
	method mover(direccion)
	{
		direccion.moverA(self)
	}
	
	method sembrar(cultivo)
	{
		if (not game.colliders(self).isEmpty())
		{
			throw new Exception("Ya hay sembrado")
		}
		
		game.addVisual(cultivo)
		sembradas.add(cultivo)
		
	}
	
	method regarActual()
	{
		game.colliders(self).forEach({planta => planta.regarse()})
	}
	
	method regarTodas()
	{
		sembradas.forEach{planta => planta.regarse()}
	}
	
	method cosecharActual()
	{
		const plantaActual = game.colliders(self).first()
		if (plantaActual.estaLista())
		{
			game.removeVisual(plantaActual)
			cosechadas.add(plantaActual)
		}
	}
	
	method cosecharUna(planta)
	{
		game.removeVisual(planta)
	}
	
	method cosecharTodas()
	{
		return oro
	}
	
	method vender()
	{
		oro = oro + cosechadas.sum({planta => planta.precio()})
		cosechadas.clear()
	}
	
	method mensajeOro()
	{
		
	}
	
	
	//method puedeMover(direccion), con position y height(), length()
	
	method moverArriba()
	{
		position = position.up(1)
	}
	
	method moverAbajo()
	{
		position = position.down(1)
	}
	
	method moverIzquierda()
	{
		position = position.left(1)
	}
	
	method moverDerecha()
	{
		position = position.right(1)
	}
	
	// Pegar acá todo lo que tenían de Toni en la etapa 1
}

object arriba
{
	method moverA(personaje)
	{
			personaje.position(personaje.position().up(1))
	}
}

object abajo
{
	method moverA(personaje)
	{
			personaje.position(personaje.position().down(1))
	}
}

object derecha
{
	method moverA(personaje)
	{
			personaje.position(personaje.position().right(1))
	}
}

object izquierda
{
	method moverA(personaje)
	{
			personaje.position(personaje.position().left(1))
	}
}