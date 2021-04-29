extends Control

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_SPACE:
			if self.visible == false:
				get_tree().paused = true
				self.visible = true
			else:
				get_tree().paused = false
				self.visible = false
