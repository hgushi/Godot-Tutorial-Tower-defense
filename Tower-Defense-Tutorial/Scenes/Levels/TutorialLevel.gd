extends BaseGame

func _ready():
	cash = 10
	lives = 1
	wave_mobs = [1,]
	wave_set = [mob,]
	$TutorialTimer.start()

func _on_TutorialTimer_timeout():
	$Tutorial.visible = true
	get_tree().paused = true
