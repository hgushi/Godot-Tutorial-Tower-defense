extends Area2D
class_name Torre

onready var Alcance = $Alcance
onready var AtaqueTimer = $AtaqueTimer
onready var Sprite = $Sprite
var inimigo_alvo = weakref(null)

var damage = 1
var cost = 10
var level = -1
var level_properties = [[50, 1, 1, Rect2(119, 323, 16, 16)],10] #range, attack interval, damage, sprite and value

var killcount = 0

signal Construction
func _ready():
	connect("Construction",get_parent(),"constructionSFX")

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

func level_Up():
	level += 1
	Alcance.shape.set_radius(level_properties[level][0])
	AtaqueTimer.wait_time = level_properties[level][1]
	damage = level_properties[level][2]
	Sprite.region_rect = level_properties[level][3]
	cost = level_properties[level][4]
	emit_signal("Construction")
	killcount = 0
