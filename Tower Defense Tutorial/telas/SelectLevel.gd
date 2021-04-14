extends Control
var scene1 : = ""
var scene2: = ""
var scene3: = ""
var level: int = 0
func load_game():
	var save_file : File = File.new()
	var erro: = save_file.open("res://Save/save.res",File.READ)
	var dados_salvos = save_file.get_var()
	if not erro:
			level = dados_salvos["level"]
func _ready ():
	load_game()
	$Level2.visible = false
	$Level3.visible = false
	if level >= 2:
		$Blocked2.visible = false
		$Level2.visible = true
	if level >= 3:
		$Blocked3.visible = false
		$Level3.visible = true
func _on_Level1_button_down():
	get_tree().change_scene(scene1)
func _on_Level2_button_down():
	get_tree().change_scene(scene2)
func _on_Level3_button_down():
	get_tree().change_scene(scene3)
