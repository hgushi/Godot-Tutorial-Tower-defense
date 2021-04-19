extends Control
var scene : = "res://telas/SelectLevel.tscn"
func _on_Controls_button_down():
	$ControlMenu.visible = true
func _on_QuitButton_button_down():
	get_tree().quit()
func _on_StartButton_button_down():
	get_tree().change_scene(scene)
