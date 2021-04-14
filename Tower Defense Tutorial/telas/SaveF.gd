extends Button
var level: int = 0
func _on_Save_button_down():
	level = 3
	save_game()
func save_game():
	var save_file : File = File.new()
	var erro: = save_file.open("res://Save/save.res",File.WRITE)
	var dados: = {"level": level}
	if not erro:
		save_file.store_var(dados)
	save_file.close()

