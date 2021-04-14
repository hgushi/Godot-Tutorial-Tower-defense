extends Area2D

export var custo = 5
export var raio_de_alcance = 50
export var intervalo_de_ataque = 1
export var sprite = Rect2( 119, 323, 16, 16 )

var tipo_de_projetil = load("res://Scenes/ElementosBase/Projétil.tscn")
var inimigo_alvo = weakref(null)
var inimigos_no_alcance = []

# Ao entrar em cena, define as propriedades da torre de acordo com seu tipo
func _ready():
	$Alcance.shape.set_radius(raio_de_alcance)
	$AtaqueTimer.wait_time = intervalo_de_ataque
	$Sprite.region_rect = sprite

# A cada frame, se houver um inimigo alvo, inicia o timer de ataque, senão define o alvo
func _physics_process(_delta):
	if !inimigo_alvo.get_ref():
		$AtaqueTimer.stop()
		
		for area in get_overlapping_areas():
			if area.is_in_group("mob"):
				if !inimigo_alvo.get_ref() or area.get_parent().offset > inimigo_alvo.get_ref().offset:
					inimigo_alvo = weakref(area.get_parent())
					
	if $AtaqueTimer.is_stopped() and not !inimigo_alvo.get_ref():
		$AtaqueTimer.start()

func _on_Torre_area_exited(area: Area2D):
	if area.get_parent() == inimigo_alvo.get_ref(): inimigo_alvo = weakref(null)

# A cada intervalo de ataque determinado, instancia um projetil e atira na direção do inimigo alvo
func _on_AtaqueTimer_timeout():
	if not !inimigo_alvo.get_ref():
		var projetil = tipo_de_projetil.instance()
		projetil.direction = (inimigo_alvo.get_ref().position - self.position).normalized()
		self.add_child(projetil)
