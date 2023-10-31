extends KinematicBody2D


var selected := false


func _on_Circle_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("click"):
		selected = not selected


func _physics_process(delta):
	if selected:
		var move = move_and_slide((get_local_mouse_position() * 5))
		move.normalized()
	rotate_circle()


func _input(event):
	if event.is_action_pressed("Rotate"):
		rotate_circle()


func rotate_circle():
	rotation += 1
