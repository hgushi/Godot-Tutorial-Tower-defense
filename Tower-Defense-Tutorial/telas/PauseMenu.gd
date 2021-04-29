extends Control
func _ready():
	self.visible = false
func _process(_delta):
	if Input.is_action_just_pressed("ui_select"):
		if get_tree().paused == false:
			get_tree().paused = true
			self.visible = true
		else :
				get_tree().paused = false
				self.visible = false
func _on_Continue_button_down():
	self.visible = false
	get_tree().paused  = false
func _on_Quit_button_down():
	get_tree().quit()
func _on_Retry_button_down():
	get_tree().reload_current_scene()
