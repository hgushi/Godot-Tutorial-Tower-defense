extends Area2D

export var custo = 5
export var raio_de_alcance = 50
export var intervalo_de_ataque = 1
export var sprite = Rect2( 11, 32, 17, 17 )
export var velocidade_projetil = 100

var projetil = load("res://Scenes/ElementosBase/Projétil.tscn")
var inimigo_alvo = Area2D
var inimigos_no_alcance = []

# Ao entrar em cena, define as propriedades da torre de acordo com seu tipo
func _ready():
	$Alcance.shape.set_radius(raio_de_alcance)
	$AtaqueTimer.wait_time = intervalo_de_ataque
#	$Sprite.region_rect = sprite

# A cada frame,inicia o timer de ataque se houver um inimigo no alcance
func _physics_process(delta):
	if len(inimigos_no_alcance) != 0 and $AtaqueTimer.is_stopped():
		$AtaqueTimer.start()

# Sempre que um inimigo entra no alcance, escolhe um novo alvo
func _on_Torre_area_entered(area: Area2D):
	inimigos_no_alcance = get_overlapping_areas()
	_set_Target()

# Se o inimigo alvo sair do alcance, e houverem outros inimgos no alcance, escolhe um novo alvo
func _on_Torre_area_exited(area: Area2D):
	inimigos_no_alcance = get_overlapping_areas()
	if area.get_parent() == inimigo_alvo and inimigos_no_alcance != []:
		_set_Target()

# Identifica qual dos inimigos no alcance está mais avançado no caminho e o torna o novo alvo
func _set_Target():
	inimigo_alvo = inimigos_no_alcance[0].get_parent()
	for inimigo in inimigos_no_alcance:
		inimigo = inimigo.get_parent() # Pega o PathFollow2D em vez do Area2D para determinar quem está mais avançado no caminho
		if (inimigo.is_in_group("mob") # Garante que o nodo observado é um inimigo e não outra torre ou projétil
			and inimigo.offset > inimigo_alvo.offset):
			inimigo_alvo = inimigo

# A cada intervalo de ataque determinado, instancia um projetil e atira na direção do inimigo alvo
func _on_AtaqueTimer_timeout():
	var tiro = projetil.instance()
	self.get_parent().add_child(tiro)
	tiro.velocity = (inimigo_alvo.position - tiro.position).normalized() * velocidade_projetil
