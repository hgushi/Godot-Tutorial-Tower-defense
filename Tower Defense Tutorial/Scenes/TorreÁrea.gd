extends Torre

var flecha = load("res://Scenes/ElementosBase/Projétil.tscn")

# A cada intervalo de ataque determinado, instancia 8 projeteis e atira na direção do inimigo alvo (com 22.5 graus entre eles)
func _on_AtaqueTimer_timeout():
		var goal = (inimigo_alvo.get_ref().position - self.position).normalized()
		var i = 0
		var rotation = 0
		
		while i <= 8:
			if goal.y > 0: rotation = acos(goal.x) - PI/2 + (PI/8 * i)
			else: rotation = - acos(goal.x) + PI/2 - (PI/8 * i)
			
			var projetil = flecha.instance()
			projetil.direction = Vector2(cos(rotation), sin(rotation))
			self.add_child(projetil)
			
			i += 1
