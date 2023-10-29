extends Area2D

var locked : bool
var area_i : Area2D

func _process(delta):
	if area_i:
		pass
	

func _on_dot_lock_area_entered(area):
	print("lock")
	if area.is_in_group('dot_lock'):
		print("connect")
	locked = true
	area_i = area
