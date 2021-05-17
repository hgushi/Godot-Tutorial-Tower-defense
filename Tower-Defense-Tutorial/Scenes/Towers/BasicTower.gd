extends Torre

var flecha = load("res://Scenes/Base/Projectile.tscn")

func _ready():
	level_properties = [[50, 1, 3, Rect2(255, 255, 16, 16),15],
						[55, 0.75, 4.5, Rect2(238, 255, 16, 16),25],
						[65, 0.6, 6, Rect2(119, 323, 16, 16),35],
						[70, 0.5, 7.5, Rect2(68, 323, 16, 16),50]]
	level_Up()

# A cada intervalo de ataque determinado, instancia um projetil e atira na direção do inimigo alvo
func _on_AtaqueTimer_timeout():
	var projetil = flecha.instance()
	projetil.alvo = inimigo_alvo
	projetil.hit = damage
	self.add_child(projetil)
