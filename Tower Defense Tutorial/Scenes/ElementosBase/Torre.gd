extends Area2D

export var custo = 5
export var raio_de_alcance = 50
export var intervalo_de_ataque = 2
export var sprite = Rect2( 11, 32, 17, 17 )
export var velocidade_projetil = 10

var projetil = load("res://Scenes/Projétil.tscn")
var inimigo_alvo = Area2D
var inimigos_no_alcance = []

# Ao entrar em cena, define as propriedades da torre de acordo com seu tipo
func _ready():
	$Alcance.radius = raio_de_alcance
	$AtaqueTimer.wait_time = intervalo_de_ataque
	$Sprite.region_rect = sprite

# A cada frame,inicia o timer de ataque se houver um inimigo no alcance
func _physics_process(delta):
	if len(inimigos_no_alcance) != 0: $AtaqueTimer.start()

# Sempre que um inimigo entra no alcance
# Verifica se ele está a frente do alvo atual e, caso sim, o torna o novo alvo
func _on_Torre_area_entered(area: Area2D):
	if area.is_in_group("mob") and area.offset > inimigo_alvo.offset:
		inimigo_alvo = area

# Sempre que o inimigo sai do alcance
# Identifica todos os inimigos que estão no alcance e define o que estiver mais na frente como novo alvo
func _on_Torre_area_exited(area: Area2D):
	if area is inimigo_alvo:
		inimigos_no_alcance = get_overlapping_areas()
		inimigo_alvo = inimigos_no_alcance[0]
		for inimigo in inimigos_no_alcance:
			if inimigo.offset > inimigo_alvo.offset: inimigo_alvo = inimigo

# A cada intervalo de ataque determinado, instancia um projetil e atira na direção do inimigo
func _on_AtaqueTimer_timeout():
	var tiro = projetil.instance()
	$Torre.get_parent().add_child(tiro)
	tiro.velocity = (inimigo_alvo.position - tiro.position).normalized() * velocidade_projetil
