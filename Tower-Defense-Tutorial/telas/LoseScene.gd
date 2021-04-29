extends Control

func _on_Retry_button_down():
	get_tree().paused = false
	get_tree().reload_current_scene()

func _on_Quit_button_down():
	get_tree().quit()
