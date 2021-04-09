extends Area2D

export var velocidade = 150
export var sprite = Rect2( 612, 51, 16, 16 )
export var hit = 1

var velocity = Vector2.ZERO
var direction = Vector2.ZERO

func _ready():
	$Sprite.region_rect = sprite
	velocity = direction * velocidade
	if direction.y > 0: self.rotation += acos(direction.x)
	else: self.rotation -= acos(direction.x)

func _physics_process(delta):
	position += velocity * delta
