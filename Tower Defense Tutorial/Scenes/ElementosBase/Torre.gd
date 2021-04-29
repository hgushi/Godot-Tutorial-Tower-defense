extends Area2D
class_name Torre

signal destroy

export var custo = 5
export var raio_de_alcance = 50
export var intervalo_de_ataque = 1
onready var AtaqueTimer = $AtaqueTimer
var inimigo_alvo = weakref(null)

# Ao entrar em cena, define as propriedades da torre de acordo com seu tipo
func _ready():
	$Alcance.shape.set_radius(raio_de_alcance)

	AtaqueTimer.wait_time = intervalo_de_ataque

	connect("destroy", self.get_parent(), "_on_Tower_destroyed")

# A cada frame, se houver um inimigo alvo, inicia o timer de ataque, senão define o alvo
func _physics_process(_delta):
	set_Target()

func set_Target():
	if !inimigo_alvo.get_ref():
		AtaqueTimer.stop()
		
		for area in get_overlapping_areas():
			if area.is_in_group("mob"):
				if !inimigo_alvo.get_ref() or area.get_parent().offset > inimigo_alvo.get_ref().offset:
					inimigo_alvo = weakref(area.get_parent())

	if AtaqueTimer.is_stopped() and not !inimigo_alvo.get_ref():
		AtaqueTimer.start()


func _on_Torre_area_exited(area: Area2D):
	if area.get_parent() == inimigo_alvo.get_ref(): inimigo_alvo = weakref(null)
	if area.is_in_group("shot") and not area.is_in_group("mina"):
		area.queue_free()
