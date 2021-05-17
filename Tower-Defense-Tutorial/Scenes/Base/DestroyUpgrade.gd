extends MenuButton

signal destroy
signal upgrade

func _ready():
	modulate = Color(1, 1, 1, 0.3)
	connect("destroy", get_parent().get_parent(), "destroy_Tower")
	connect("upgrade", get_parent().get_parent(), "level_Up")
	get_popup().connect("id_pressed", self, "_on_item_pressed")

func _physics_process(_delta):
	var tower = get_parent().get_parent()
	if tower.killcount >= 3 and tower.level < len(tower.level_properties) - 1:
		get_popup().set_item_disabled(1, false)

func _on_DestroyUpgradeButton_mouse_entered():
	modulate = Color(1, 1, 1, 1)
	
func _on_DestroyUpgradeButton_mouse_exited():
	modulate = Color(1, 1, 1, 0.3)

func _on_item_pressed(id):
	if id == 0:
		emit_signal("destroy")
	elif id == 1:
		emit_signal("upgrade")
		get_popup().set_item_disabled(1, true)
