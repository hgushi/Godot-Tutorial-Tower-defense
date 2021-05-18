extends Torre

var bomb = load("res://Scenes/Base/Bomb.tscn")
var path_in_range = []

func _ready():
	level_properties = [[50, 5, 4, Rect2(136, 323, 16, 16),25],
						[60, 4.5, 7, Rect2(51, 323, 16, 16),40],
						[70, 4, 10, Rect2(34, 323, 16, 16),55]]
	level_Up()

func _on_AtaqueTimer_timeout():
	if get_child_count() <= 20:
		set_Target()
		var projetil = bomb.instance()
		projetil.hit = damage
		
		if not path_in_range.empty():
			var i = rand_range(0, len(path_in_range))
			projetil.alvo = path_in_range[i]
		
#		projetil.global_position = self.global_position
		add_child(projetil)

func set_Target():
	for point in get_parent().caminho:
		if point.distance_to(global_position) <= (Alcance.shape.radius * 2):
			path_in_range.append(point)
