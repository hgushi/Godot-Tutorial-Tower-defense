extends Torre

var mina = load("res://Scenes/ElementosBase/Mina.tscn")
var caminho_no_alcance = []

func _on_AtaqueTimer_timeout():
	set_Target()
	var projetil = mina.instance()
	
	if not caminho_no_alcance.empty():
		var i = rand_range(0, len(caminho_no_alcance))
		projetil.alvo = caminho_no_alcance[i]
	
	projetil.position = self.position
	get_parent().add_child(projetil)

func set_Target():
	for point in get_parent().caminho:
		if point.distance_to(global_position) <= (raio_de_alcance * 2):
			caminho_no_alcance.append(point)
