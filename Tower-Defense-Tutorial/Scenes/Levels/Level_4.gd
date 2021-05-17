extends BaseGame

func _ready():
	cash = 60
	wave_mobs = [3, 6, 10, 17, 25, 34, 45,]
	wave_set = [mob,mob,mob,mob2,mob,mob2,mob2,mob,mob,mob,mob2,mob2,mob2,mob3,mob,mob,mob,mob2,mob3,mob,mob,mob2,mob2
	,mob3,mob2,mob2,mob,mob,mob,mob3,mob2,mob,mob2,mob,mob3,mob3,mob,mob,mob,mob2,mob2,mob3,mob3,mob2,mob2,mob2,mob2,mob2
	,mob3,mob2,mob,mob,mob,mob3,mob,mob,mob2,mob,mob3,mob3,mob2,mob,mob,mob2,mob2,mob,mob3,mob2,mob,mob,mob2,mob2,mob2,
	mob3,mob,mob,mob,mob3,mob3,mob2,mob2,mob2,mob,mob3,mob,mob2,mob2,mob2,mob,mob,mob,mob2,mob3,mob3,mob3,mob,mob,mob,
	mob2,mob2,mob2,mob3,mob3,mob,mob2,mob,mob2,mob3,mob3,mob,mob,mob2,mob,mob2,mob,mob2,mob3,mob3,mob3,mob,mob,mob2,mob2,
	mob,mob,mob2,mob3,mob2,mob,mob,mob,mob2,mob2,mob3,mob3,mob3,mob3,mob3,mob3,mob3]
