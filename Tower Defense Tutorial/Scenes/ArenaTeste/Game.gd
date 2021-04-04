extends Node2D

var tower = load("res://Scenes/Torre.tscn") #colocar torre aqui
var mob = load("res://Scenes/Enemy.tscn")
var instance

var building = false

var cash = 50
var wave = 0
var mobs_left = 0
var wave_mobs = [5, 15, 30]

func _ready():
	$WaveTimer.start()

func _physics_process(delta):
	$CashLabel.text = "cash: " + str(cash)

func _on_TextureButton_pressed():
	if !building and cash >= 25:
		instance = tower.instance()
		add_child(instance)
		building = true

func tower_built():
	building = false
	cash -= 25

func add_cash(num):
		cash += num

func _on_WaveTimer_timeout():
	mobs_left = wave_mobs[wave]
	$MobTimer.start()

func _on_MobTimer_timeout():
	instance = mob.instance()
	$Caminho.add_child(instance)
	mobs_left -=1
	if mobs_left <= 0:
		$MobTimer.stop()
		wave =+ 1
		if wave < len(wave_mobs):
			$WaveTimer.start()
	
	
