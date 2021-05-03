extends Control
var scene1 : = "res://Scenes/ArenaTeste/Level_2.tscn"
var scene2: = "res://Scenes/ArenaTeste/Level_3.tscn"
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
	if level >= 2:
		$Blocked2.visible = false
		$Level2.visible = true
	if level >= 3:
		$Blocked3.visible = false
		$Level3.visible = true
func _on_Level1_button_down():
	var erro = get_tree().change_scene(scene1)
	if (erro == ERR_CANT_OPEN):
		print("não consegui abrir")
	elif (erro == ERR_CANT_CREATE):
		print("não consegui instancia")
	else:
		erro
func _on_Level2_button_down():
	var erro = get_tree().change_scene(scene2)
	if (erro == ERR_CANT_OPEN):
		print("não consegui abrir")
	elif (erro == ERR_CANT_CREATE):
		print("não consegui instancia")
	else:
		erro
func _on_Level3_button_down():
	var erro = get_tree().change_scene(scene3)
	if (erro == ERR_CANT_OPEN):
		print("não consegui abrir")
	elif (erro == ERR_CANT_CREATE):
		print("não consegui instancia")
	else:
		erro
