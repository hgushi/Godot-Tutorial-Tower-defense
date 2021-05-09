extends ColorRect

func _on_Continue_button_down():
	$Tutorial1.visible = false
	$Tutorial2.visible = true
	$Continue.visible = false
	$Continue2.visible = true

func _on_Continue2_button_down():
	get_tree().paused = false
	self.visible = false
