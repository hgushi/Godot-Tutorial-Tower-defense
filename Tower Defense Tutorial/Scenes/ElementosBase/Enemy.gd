extends PathFollow2D

signal dead

# Declare member variables here. Examples:
var speed = 20
var hp = 10

func _ready():
	self.connect("dead", self.get_parent().get_node("Torre"), "_on_Enemy_dead")

func _physics_process(delta):
	offset += speed * delta
	if unit_offset >= 1:
		reached_end()

func reached_end():
	emit_signal("dead", self)
	queue_free()

func _on_Area2D_area_entered(area):
	if area.is_in_group("shot"):
		area.queue_free()
		hp -= 1
		if hp <= 0:
			get_parent().get_parent().add_cash(5)
			emit_signal("dead", self)
			queue_free()
			
