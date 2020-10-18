extends Sprite

var velocidad = 800

var aceleracion = 0

onready var jugador = get_parent().get_parent().get_node("Jugador")

var activado     

var limite_bajada = 0

var limite_subida = 0

func _physics_process(delta):
	aceleracion = velocidad * delta
	if activado && limite_bajada > 0:
		movimiento_cadena(10)
		limite_bajada -= 1
		limite_subida += 1
	elif !activado && limite_subida > 0:
		movimiento_cadena(-10)
		limite_subida -=1
		limite_bajada +=1


func movimiento_cadena(n):
	region_rect = Rect2(0,0,region_rect.size.x, aceleracion)
	set_offset(Vector2(get_offset().x,aceleracion / 2))
	velocidad += n

func set_limite_bajada(limite:int)->void: 
	if limite_bajada == 0 && limite_subida == 0:
		limite_bajada = limite


func activar():
	activado    = true

func  desactivar():
	activado    = false
