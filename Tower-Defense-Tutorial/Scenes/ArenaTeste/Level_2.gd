extends Node2D

var t_basica = load("res://Scenes/TorreBasica.tscn")
var t_area = load("res://Scenes/TorreÁrea.tscn")
var t_mina = load("res://Scenes/TorreMina.tscn")

var tower_button = load("res://Scenes/ElementosBase/BuildTowerButton.tscn")

var mob = load("res://Scenes/ElementosBase/Enemy_Desajeitado.tscn")
var instance

var building = false

var cash = 30
var lives = 10
var wave = 0
var mobs_left = 0
var wave_mobs = [1, 3, 5, 10, 15]

var towers = []
var caminho = []
onready var MobTimer = $MobTimer
onready var WaveTimer = $WaveTimer
func _ready():
	WaveTimer.start()
	get_node("CanvasLayer").get_node("PauseMenu").visible = false
	get_node("CanvasLayer").get_node("LoseScene").visible = false
	get_node("CanvasLayer").get_node("WinScene").visible = false
	for point in $Caminho.get_curve().get_baked_points():
		caminho.append(to_global(point))

func _physics_process(_delta):
	$CashLabel.text = "cash: " + str(cash)
	$WaveLabel.text = "wave: " + str(wave) 
	MobTimer.wait_time = rand_range(0.5, 3) #Coloquei só para testar deixar um pouco mais aleatório
	if lives <= 0:
		get_node("CanvasLayer").get_node("LoseScene").get_node("LoseMusic").play()
		get_node("CanvasLayer").get_node("LoseScene").visible = true
		get_tree().paused = true
	if wave >= 5 and get_node("Caminho").get_children().size() == 0 :
		get_node("CanvasLayer").get_node("WinScene").visible = true 
		get_node("CanvasLayer").get_node("WinScene").get_node("WinMusic").play()
		get_tree().paused = true

func _on_BuildTowerButton_pressed(ID, TowerPosition, TowerValue):
	if cash >= TowerValue:
		if ID == 0: instance = t_basica.instance()
		elif ID == 1: instance = t_mina.instance()
		if ID == 2: instance = t_area.instance()
		$ConstructSFX.play()
		towers.append(instance)
		instance.set_position(TowerPosition)
		add_child(instance)
		
	if cash >= TowerValue:
		cash -= TowerValue

func add_cash(num):
		cash += num

func _on_WaveTimer_timeout():
	mobs_left = wave_mobs[wave]
	MobTimer.start()

func _on_MobTimer_timeout():
	instance = mob.instance()
	instance.connect("lose_a_life",self,"lose_a_life")
	$Caminho.add_child(instance)
	mobs_left -=1
	if mobs_left <= 0:
		MobTimer.stop()
		if wave < 5:
			wave += 1
		if wave < len(wave_mobs):
			WaveTimer.start()
			$MobSFX.play()

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		for tower in towers:
			var distance_from_center = sqrt(pow((event.global_position.x - tower.global_position.x), 2) + pow((event.global_position.y - tower.global_position.y), 2))
			if distance_from_center <= 16:
				instance = tower_button.instance()
				instance.rect_position = tower.position - Vector2(8,8)
				self.add_child(instance)
				
				towers.erase(tower)
				tower.queue_free()
				break

func lose_a_life():
	lives -= 10
	lives = max(lives,0)
	$LivesLabel.text = "lives: " + str(lives)


func _on_Pause_button_down():
	get_tree().paused = true
	get_node("CanvasLayer").get_node("PauseMenu").visible = true

func _on_Quit_button_down():
	get_tree().quit()
	

func _on_Continue_button_down():
	get_tree().paused = false
	get_node("CanvasLayer").get_node("PauseMenu").visible = false

func _on_Retry_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func arrowSFX():
	$ArrowSFX.play()
	
func bombSFX():
	$BombSFX.play()
	
func deathSFX():
	$DeathSFX.play()
