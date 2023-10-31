extends Area2D

var dot_i : Area2D
var dot_selected : bool
var locked : bool


func _process(delta):
	lock_dot(delta)
	move_dot(delta)


func _on_dot_lock_area_entered(area):
	if area.is_in_group('dot') and not area.occupied:
		if not dot_i:
			insert_dot(area)


func _on_dot_lock_area_exited(area):
	if area == dot_i and dot_selected:
		remove_dot(area)


func _on_dot_lock_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("click") and dot_i:
		dot_selected = not dot_selected


func insert_dot(area):
	area.set_physics_process(false)
	area.occupied = true
	area.selected = false
	dot_i = area
	locked = true


func move_dot(delta):
	if dot_selected and dot_i:
		dot_i.global_position = lerp(dot_i.global_position, get_global_mouse_position(), 20 * delta)


func lock_dot(_delta):
	if locked and not dot_selected:
		dot_i.global_position = global_position


func remove_dot(area):
	area.set_physics_process(true)
	area.occupied = false
	area.selected = true
	dot_i = null
	locked = false
	dot_selected = false
