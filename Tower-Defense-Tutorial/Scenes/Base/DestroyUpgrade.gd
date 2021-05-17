extends MenuButton

signal destroy
signal upgrade
signal find_cash
signal active_reduce_cash
signal money
var price
var my_cash
onready var PopupMenu = $PopupMenu

func _ready():
	modulate = Color(1, 1, 1, 0.3)
	connect("upgrade", get_parent().get_parent(), "level_Up")
	connect("find_cash",get_parent().get_parent().get_parent(),"emit_cash")
	connect("money",self,"my_money")
	connect("active_reduce_cash",get_parent().get_parent().get_parent(),"reduce_cash")
	get_popup().connect("id_pressed", self, "_on_item_pressed")

#func _process(_delta):

func _physics_process(_delta):
	var tower = get_parent().get_parent()
	if tower.level >= len(tower.level_properties) - 1:
		get_popup().set_item_text(1, "Max level reached")
	elif tower.killcount >= 5:
		get_popup().set_item_disabled(1, false)

func _on_DestroyUpgradeButton_mouse_entered():
	modulate = Color(1, 1, 1, 1)
	
func _on_DestroyUpgradeButton_mouse_exited():
	modulate = Color(1, 1, 1, 0.3)

func _on_item_pressed(id):
	if id == 0:
		get_parent().get_parent().queue_free()
	elif id == 1:
		emit_signal("find_cash")
		if my_cash >= price:
			emit_signal("upgrade")
			emit_signal("active_reduce_cash")
			get_popup().set_item_disabled(1,true)

func price(cost):
	price = cost

func my_money(money):
	my_cash = money
