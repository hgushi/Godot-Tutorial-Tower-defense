extends PathFollow2D

# Declare member variables here. Examples:
var speed = 6.5
var hp = 90
signal arrowSFX
signal bombSFX
signal deathSFX

func _ready():
	connect("bombSFX",self.get_parent().get_parent(),"bombSFX")
	connect("deathSFX",self.get_parent().get_parent(),"deathSFX")
	connect("arrowSFX",self.get_parent().get_parent(),"arrowSFX")
	
func _physics_process(delta):
	offset += speed * delta
	if unit_offset >= 1:
		get_parent().get_parent().lose_a_life(2)
		queue_free()

func _on_Area2D_area_entered(projetil):
	if projetil.is_in_group("shot"):
		hp -= projetil.hit
		emit_signal("arrowSFX")
		if hp <= 0:
			emit_signal("deathSFX")
			get_parent().get_parent().add_cash(5)
			queue_free()
			projetil.get_parent().killcount += 1
		projetil.queue_free()
	if projetil.is_in_group("bomb"):
		hp -= projetil.hit
		emit_signal("bombSFX")
		if hp <= 0:
			emit_signal("deathSFX")
			get_parent().get_parent().add_cash(5)
			queue_free()
			projetil.get_parent().killcount += 1
		projetil.queue_free()
