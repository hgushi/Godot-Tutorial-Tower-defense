extends Node2D
var mob = load("res://Scenes/ElementosBase/Enemy_Desajeitado.tscn")
var mob2 = load("res://Scenes/ElementosBase/Enemy_Desajeitado.tscn")
var mob3 = load("res://Scenes/ElementosBase/Enemy_Desajeitado.tscn")
var wave_set : = [mob,mob2,mob3,mob,mob,mob2,mob,mob3,mob3,mob,mob2,mob,mob,mob3,mob2,mob3,mob3,mob,mob2,mob3,mob2,mob,mob3,mob3,mob,mob2,mob3,mob3,mob2,mob,mob3,mob2,mob3,mob,mob2,]
func _process(_delta):
	var a = wave_set.size()
	print(a)
