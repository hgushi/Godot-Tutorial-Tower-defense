extends MenuButton

signal build

var popup
var TowerValue

func _ready():
	modulate = Color(1, 1, 1, 0.6)
	connect("mouse_entered", self, "_on_BuildTowerButton_mouse_entered")
	connect("mouse_exited", self, "_on_BuildTowerButton_mouse_exited")
	connect("build", self.get_node(".."), "_on_BuildTowerButton_pressed")
	popup = get_popup()
	popup.connect("id_pressed", self, "_on_item_pressed")

func _on_BuildTowerButton_mouse_entered():
	modulate = Color(1, 1, 1, 1)
	
func _on_BuildTowerButton_mouse_exited():
	modulate = Color(1, 1, 1, 0.6)

func _on_item_pressed(ID):
	self.disabled = true
	self.visible = false
	$ConstructSFX.play()
	var TowerPosition = rect_position + rect_size / 2
	if ID == 0:
		TowerValue = 10
	elif ID == 1:
		TowerValue = 20
	else:
		TowerValue = 40	
	emit_signal("build", ID, TowerPosition, TowerValue)

