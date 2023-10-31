extends KinematicBody2D


var selected := false


func _on_Circle_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("click"):
		selected = not selected


func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 10 * delta)
