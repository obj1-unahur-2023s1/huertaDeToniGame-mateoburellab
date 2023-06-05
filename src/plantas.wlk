import wollok.game.*

class Maiz {
	var property position
	var property estado = bebe
	
	method regarse()
	{
		estado = adulto
	}
	
	method estaLista()
	{
		return estado == adulto
	}
	
	method precio()
	{
		return 150
	}
	
	method image() {
		// Modificar esto para que la imagen dependa del estado.
		return estado.image()
	}
}

class Trigo {
	var property position
	var etapa = 0
	method image() {
		// Modificar esto para que la imagen dependa del estado.
		return "trigo_" + etapa + ".png"
	}
	
	method regarse()
	{
		etapa = (etapa + 1) % 4
	}
	
	method precio()
	{
		return etapa * 100
	}
}

class Tomaco {
	var property position
	method image() {
		// Modificar esto para que la imagen dependa del estado.
		return "tomaco_ok.png"
	}
	
	method precio()
	{
		return 75
	}
}

object bebe
{
	method image()
	{
		return "maiz_bebe.png"
	}
}

object adulto
{
	method image()
	{
		return "maiz_adulto.png"
	}
}

// Agregar las demás plantas y completar el Maiz.