extends Node2D

onready var mob = preload("res://Scenes/Mob1.tscn")

var mobs_remaining = 0

func _ready():
	$Mob_timer.start(1)
	mobs_remaining = 5

func _on_Mob_timer_timeout():
	var mob_instance = null
	mob_instance = mob.instance()
	
	mob_instance.position = $Start_position.position
	mob_instance.destination = $End_position.position
	
	var path = $Navigation2D.get_simple_path($Start_position.position, $End_position.position)
	mob_instance.set_path(path)
	
	$entities.add_child(mob_instance)
	
	mobs_remaining -= 1
	if mobs_remaining > 0:
		$Mob_timer.start(1)
	
