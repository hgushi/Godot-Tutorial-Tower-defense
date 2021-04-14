extends Control
func _ready():
	self.visible = false
func _process(_delta):
	var health = 50
	if health == 0:
		self.visible = true
		get_tree().paused = true
		$LoseMusic.play()
func _on_Retry_button_down():
	get_tree().reload_current_scene()
func _on_Quit_button_down():
	get_tree().quit()
