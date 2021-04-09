extends Node2D

var tower = load("res://Scenes/ElementosBase/Torre.tscn")
var mob = load("res://Scenes/ElementosBase/Enemy.tscn")
var instance

var building = false

var cash = 30
var wave = 0
var mobs_left = 0
var wave_mobs = [1, 5, 10]

func _ready():
	$WaveTimer.start()

func _physics_process(delta):
	$CashLabel.text = "cash: " + str(cash)
	$MobTimer.wait_time = rand_range(0.5, 2) #Coloquei só para testar deixar um pouco mais aleatório

func _on_BuildTowerButton_pressed(ID, pos):
	#if !building and cash >= 25:
	if cash >= 10: #trocar pelo preço da torre escolhida
		instance = tower.instance()
		instance.set_position(pos)
		add_child(instance)
#	building = true
#
#func tower_built():
#	building = false
	cash -= 10 #trocar pelo preço da torre escolhida

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
		wave += 1
		if wave < len(wave_mobs):
			$WaveTimer.start()
	
	
