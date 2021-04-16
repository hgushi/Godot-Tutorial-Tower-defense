extends Area2D

export var velocidade = 150
export var sprite = Rect2( 612, 51, 16, 16 )
export var hit = 1

var direction = Vector2.DOWN
var alvo = weakref(null)

func _ready():
	$Sprite.region_rect = sprite

func _physics_process(delta):
	if not !alvo.get_ref():
		direction = (alvo.get_ref().global_position - self.global_position).normalized()
	
	if direction.y > 0: self.rotation = PI/4 + acos(direction.x)
	else: self.rotation = PI/4 - acos(direction.x)
	
	translate(direction * velocidade * delta)
