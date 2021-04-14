extends "res://Scenes/ElementosBase/Torre.gd"

var flecha = load("res://Scenes/ElementosBase/Projétil.tscn")

# A cada intervalo de ataque determinado, instancia um projetil e atira na direção do inimigo alvo
func _on_AtaqueTimer_timeout():
	if not !inimigo_alvo.get_ref():
		var projetil = flecha.instance()
		projetil.direction = (inimigo_alvo.get_ref().position - self.position).normalized()
		self.add_child(projetil)
