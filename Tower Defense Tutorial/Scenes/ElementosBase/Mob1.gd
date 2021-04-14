extends Area2D


# Declare member variables here. Examples:
var speed = 100
var path := PoolVector2Array() setget set_path
var destination = Vector2()


func ready():
	$MobSFX.play()

func _physics_process(delta):
	if path.size() > 0:
		var distance = speed * delta
		move_along_path(distance)
	elif abs(position.x - destination.x) < 10 and abs(position.y - destination.y) < 10:
		queue_free()

func move_along_path(distance):
	var start_pos = position
	for _i in range(path.size()):
		var distance_to_next = start_pos.distance_to(path[0])
		if distance <= distance_to_next and distance > 0:
			position = start_pos.linear_interpolate(path[0], distance / distance_to_next)
			break
		elif distance <= 0:
			position = path[0]
			break
		distance -= distance_to_next
		start_pos = path[0]
		path.remove(0)

func set_path(new_path):
	path = new_path
