extends Control
var scene : = "res://UI/CreditsScene.tscn"
func _on_NextLevel_button_down():
	get_tree().change_scene(scene)
func _on_Quit_button_down():
	get_tree().quit()
