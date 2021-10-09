extends MenuButton

#signal destroy
signal upgrade
signal active_reduce_cash
var price = 0

func _ready():
	modulate = Color(1, 1, 1, 0.3)
	connect("upgrade", get_parent().get_parent(), "level_Up")
	connect("active_reduce_cash",get_parent().get_parent().get_parent(),"reduce_cash")
	get_popup().connect("id_pressed", self, "_on_item_pressed")

func _physics_process(_delta):
	if get_parent().get_parent().level >= len(get_parent().get_parent().level_properties) - 1:
		get_popup().set_item_text(1, "Max level reached")
	elif get_parent().get_parent().killcount >= 5:
		get_popup().set_item_text(1, "Upgrade:" + str(get_parent().get_parent().cost))
		get_popup().set_item_disabled(1, false)

func _on_DestroyUpgradeButton_mouse_entered():
	modulate = Color(1, 1, 1, 1)

func _on_DestroyUpgradeButton_mouse_exited():
	modulate = Color(1, 1, 1, 0.3)

func _on_item_pressed(id):
	var tower = get_parent().get_parent()
	var BaseGame = tower.get_parent()
	if id == 0:
		tower.queue_free()
	elif id == 1:
		price = tower.cost 
		if BaseGame.cash  >= price :
			emit_signal("upgrade")
			emit_signal("active_reduce_cash",price)
			get_popup().set_item_disabled(1,true)
