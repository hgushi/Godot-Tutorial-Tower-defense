extends Control
var scene : = ""
func _ready():
	self.visible = false
func _process(_delta):
	var health = 50
	if health == 0:
		self.visible = true
		get_tree().paused = true
		$WinMusic.play()
func _on_NextLevel_button_down():
	get_tree().change_scene(scene)
func _on_Quit_button_down():
	get_tree().quit()
