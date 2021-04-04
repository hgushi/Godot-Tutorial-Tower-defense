extends Area2D

export var custo = 5
export var raio_de_alcance = 50
var alvo

func _ready() -> void:
	$Alcance.radius = raio_de_alcance

func _on_Torre_area_entered(_area: Area2D):
	#if _area.is_in_group("mob") and :
	pass

func _on_Torre_area_exited(_area: Area2D):
	#verificar se o que saiu foi o target
	#identificar o próximo target
	pass

func atirar():
	#detectar qual inimigo está mais na frente e atribuir a target
	#iniciar o timer de tiro
	#projétil tem que seguir na direção do inimigo escolhido
	pass
