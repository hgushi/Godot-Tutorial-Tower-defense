extends Torre

var flecha = load("res://Scenes/ElementosBase/Projétil.tscn")

# A cada intervalo de ataque determinado, instancia um projetil e atira na direção do inimigo alvo
func _on_AtaqueTimer_timeout():
	var projetil = flecha.instance()
	projetil.alvo = inimigo_alvo
	self.add_child(projetil)
