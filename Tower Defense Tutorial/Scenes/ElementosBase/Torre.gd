extends Area2D

export var custo = 5
export var raio_de_alcance = 50
export var intervalo_de_ataque = 1
export var sprite = Rect2( 119, 323, 16, 16 )

var tipo_de_projetil = load("res://Scenes/ElementosBase/Projétil.tscn")
var inimigo_alvo = Area2D
var inimigos_no_alcance = []
var target_set = false # Variável de passagem que define se há um alvo definido

# Ao entrar em cena, define as propriedades da torre de acordo com seu tipo
func _ready():
	$Alcance.shape.set_radius(raio_de_alcance)
	$AtaqueTimer.wait_time = intervalo_de_ataque
	$Sprite.region_rect = sprite

# A cada frame, se houver um inimigo alvo, inicia o timer de ataque, senão define o alvo
func _physics_process(delta):
	if target_set and $AtaqueTimer.is_stopped(): $AtaqueTimer.start()
	else: _set_Target()

# Se o inimigo alvo deixar de existir, escolhe um novo alvo
func on_Enemy_dead(inimigo):
	if inimigo == inimigo_alvo:
		target_set = false
		_set_Target()

# Se o inimigo alvo sair do alcance, escolhe um novo alvo
func _on_Torre_area_exited(area: Area2D):
	if area.get_parent() == inimigo_alvo:
		target_set = false
		_set_Target()

# Define o inimigo alvo, identificando entre os inimigos no alcance qual está mais avançado no caminho
func _set_Target():
	for area in get_overlapping_areas():
		if area.is_in_group("mob"): inimigos_no_alcance.append(area)
	
	if !inimigos_no_alcance.empty() and inimigos_no_alcance[0] != null:
		inimigo_alvo = inimigos_no_alcance[0].get_parent()
		for inimigo in inimigos_no_alcance:
			inimigo = inimigo.get_parent() # Pega o PathFollow2D em vez do Area2D identificado na colisão
			if inimigo.offset > inimigo_alvo.offset: inimigo_alvo = inimigo
		target_set = true

# A cada intervalo de ataque determinado, instancia um projetil e atira na direção do inimigo alvo
func _on_AtaqueTimer_timeout():
	if target_set:
		var projetil = tipo_de_projetil.instance()
		projetil.direction = (inimigo_alvo.position - self.position).normalized()
		self.add_child(projetil)
