extends Torre

var flecha = load("res://Scenes/Base/Projectile.tscn")

func _ready():
	level_properties = [[50, 1, 1, Rect2(102, 323, 16, 16)],
						[55, 1, 2, Rect2(102, 323, 16, 16)],
						[65, 0.5, 3, Rect2(102, 323, 16, 16)],
						[70, 0.5, 4, Rect2(102, 323, 16, 16)]]
						
# A cada intervalo de ataque determinado, instancia 8 projeteis e atira na direção do inimigo alvo (com 22.5 graus entre eles)
func _on_AtaqueTimer_timeout():
	if not !inimigo_alvo.get_ref():
		var goal = (inimigo_alvo.get_ref().position - self.position).normalized()
		var i = 0
		var rotation = 0
		
		while i <= 8:
			if goal.y > 0: rotation = acos(goal.x) - PI/2 + (PI/8 * i)
			else: rotation = - acos(goal.x) + PI/2 - (PI/8 * i)
			
			var projetil = flecha.instance()
			projetil.direction = Vector2(cos(rotation), sin(rotation))
			projetil.hit = damage
			self.add_child(projetil)
			
			i += 1
