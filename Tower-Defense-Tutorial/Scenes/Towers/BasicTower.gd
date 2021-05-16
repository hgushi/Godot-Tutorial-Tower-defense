extends Torre

var flecha = load("res://Scenes/Base/Projectile.tscn")

func _ready():
	level_properties = [[50, 1, 1, Rect2(255, 255, 16, 16)],
						[55, 0.75, 1.5, Rect2(238, 255, 16, 16)],
						[65, 0.6, 2, Rect2(119, 323, 16, 16)],
						[70, 0.5, 2.5, Rect2(68, 323, 16, 16)]]
	level_Up()

# A cada intervalo de ataque determinado, instancia um projetil e atira na direção do inimigo alvo
func _on_AtaqueTimer_timeout():
	var projetil = flecha.instance()
	projetil.alvo = inimigo_alvo
	projetil.hit = damage
	self.add_child(projetil)
