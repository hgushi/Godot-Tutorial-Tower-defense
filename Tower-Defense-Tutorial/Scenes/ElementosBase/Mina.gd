extends Area2D

export var velocidade = 50
export var hit = 2

var alvo = position
var direction = Vector2.ZERO

func _physics_process(delta):
	if global_position.distance_to(alvo) > 1:
		direction = (alvo - global_position).normalized()
		translate(direction * velocidade * delta)

#func _ready():
#	direction = (alvo - global_position).normalized()
#	var ajuste = (alvo - get_parent().global_position).normalized() * 10
#
#	if direction.y > 0: alvo -= ajuste
#	else: alvo += ajuste

