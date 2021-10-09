extends Control

var level: int = 0
func load_game():
	var save_file : File = File.new()
	var erro: = save_file.open("res://Save/save.res",File.READ)
	var dados_salvos = save_file.get_var()
	if not erro:
			level = dados_salvos["level"]
func _ready ():
	load_game()
	if level >= 1:
		$Blocked1.visible = false
		$Level1.visible = true
	if level >= 2:
		$Blocked2.visible = false
		$Level2.visible = true
	if level >= 3:
		$Blocked3.visible = false
		$Level3.visible = true
		

func _on_Tutorial_button_down():
	get_tree().change_scene("res://Scenes/Levels/TutorialLevel.tscn")


func _on_Level1_button_down():
	 get_tree().change_scene("res://Scenes/Levels/Level_2.tscn")


func _on_Level2_button_down():
	get_tree().change_scene("res://Scenes/Levels/Level_3.tscn")


func _on_Level3_button_down():
	get_tree().change_scene("res://Scenes/Levels/Level_4.tscn")
