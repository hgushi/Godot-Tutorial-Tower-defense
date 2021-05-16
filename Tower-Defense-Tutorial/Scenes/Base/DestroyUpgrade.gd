extends MenuButton

signal destroy
signal upgrade

func _ready():
	modulate = Color(1, 1, 1, 0.3)
	connect("destroy", get_parent().get_parent(), "destroy_Tower")
	connect("upgrade", get_parent().get_parent(), "level_Up")

func _physics_process(delta):
	var tower = get_parent().get_parent()
	if tower.killcount == 3:
		$PopupMenu.set_item_disabled(1, false)

func _on_DestroyUpgradeButton_mouse_entered():
	modulate = Color(1, 1, 1, 1)
	
func _on_DestroyUpgradeButton_mouse_exited():
	modulate = Color(1, 1, 1, 0.3)

func _on_item_pressed(ID):
	if ID == 0:
		emit_signal("destroy")
	elif ID == 1:
		emit_signal("upgrade")
		$PopupMenu.set_item_disabled(1, true)
	

