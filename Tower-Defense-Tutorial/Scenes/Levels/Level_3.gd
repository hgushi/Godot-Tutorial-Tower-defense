extends BaseGame

func _ready():
	cash = 40
	wave_mobs = [2, 5, 8, 15, 23, 35]
	wave_set = [mob,mob,mob2,mob2,mob,mob,mob,mob2,mob,mob,mob,mob2,mob2,mob,mob3,mob,mob,mob2,mob2,mob,mob,mob2,mob2,
	mob,mob,mob,mob2,mob2,mob2,mob3,mob2,mob2,mob2,mob,mob,mob2,mob3,mob,mob2,mob,mob2,mob,mob,mob2,mob3,mob,mob,mob2,
	mob,mob2,mob2,mob3,mob3,mob,mob2,mob2,mob,mob,mob,mob3,mob3,mob2,mob,mob,mob2,mob,mob2,mob2,mob2,mob3,mob3,mob3,
	mob,mob,mob2,mob2,mob,mob,mob2,mob,mob2,mob,mob2,mob,mob2,mob2,mob,mob3,mob3,mob3,mob3,]
