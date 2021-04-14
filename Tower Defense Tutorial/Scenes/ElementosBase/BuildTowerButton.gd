extends MenuButton

signal build

var popup
var TowerValue

func _ready():
	modulate = Color(1, 1, 1, 0.3)
	connect("mouse_entered", self, "_on_BuildTowerButton_mouse_entered")
	connect("mouse_exited", self, "_on_BuildTowerButton_mouse_exited")
	connect("build", self.get_parent().get_parent(), "_on_BuildTowerButton_pressed")
	popup = get_popup()
	get_popup().add_item("Torre Básica  $10")
	get_popup().add_item("Torre Área     $20")
	get_popup().add_item("Torre Mina     $25")
	popup.connect("id_pressed", self, "_on_item_pressed")

func _on_BuildTowerButton_mouse_entered():
	modulate = Color(1, 1, 1, 1)
	
func _on_BuildTowerButton_mouse_exited():
	modulate = Color(1, 1, 1, 0.3)

func _on_item_pressed(ID):
	var TowerPosition = self.get_parent().rect_position + self.get_parent().rect_size / 2
	if ID == 0:
		TowerValue = 10
	elif ID == 1:
		TowerValue = 20
	else:
		TowerValue = 25	
	if self.get_parent().get_parent().cash >= TowerValue:
		self.disabled = true
		self.visible = false
	emit_signal("build", ID, TowerPosition, TowerValue)

