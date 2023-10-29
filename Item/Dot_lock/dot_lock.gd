extends Area2D

var locked : bool
var area_i : Area2D

func _process(delta):
	if area_i:
		area_i.global_position = global_position
	

func _on_dot_lock_area_entered(area):
	if area_i:
		return
	if area.is_in_group('dot_lock'):
		print("connect")
		locked = true
		area_i = area
