extends Control

func _process(_delta):
	if Input.is_action_just_pressed("ui_select"):
		if get_tree().paused == false:
			get_tree().paused = true
			self.visible = true
		else :
				get_tree().paused = false
				self.visible = false
