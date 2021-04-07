extends MenuButton

signal build

var popup

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
	var pos = rect_position + rect_size / 2
	print("rect_position =",rect_position)
	print("rect_size =",rect_size)
	emit_signal("build", ID, pos)
	print(popup.get_item_text(ID), " pressed")

