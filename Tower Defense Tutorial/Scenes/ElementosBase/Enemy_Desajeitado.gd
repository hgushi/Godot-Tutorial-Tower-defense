extends PathFollow2D

# Declare member variables here. Examples:
var speed = 20
var hp = 2
signal lose_a_life

func _physics_process(delta):
	offset += speed * delta
	if unit_offset >= 1:
		reached_end()

func reached_end():
	emit_signal("lose_a_life")
	queue_free()

func _on_Area2D_area_entered(projetil):
	if projetil.is_in_group("shot"):
		hp -= projetil.hit
		$ArrowSFX.play()
		projetil.queue_free()
		if hp <= 0:
			$DeathSFX.play()
			get_parent().get_parent().add_cash(5)
			queue_free()
			
