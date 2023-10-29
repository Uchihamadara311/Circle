extends Node2D

var selected := false
var connect_dot := false
var rest_point
var rest_nodes = []

func _ready():
	rest_nodes = get_tree().get_nodes_in_group("zone")
	locate_point()

func _on_Area2D_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true

func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 5 * delta)
	if connect_dot:
		global_position = lerp(global_position, rest_point, 5 * delta)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			selected = false
			locate_point()

func locate_point():
	var shortest_dist = 55
	for child in rest_nodes:
		var distance = global_position.distance_to(child.global_position)
		if distance < shortest_dist:
				connect_dot = true
				child.select()
				rest_point = child.global_position
				shortest_dist = distance
		if distance > shortest_dist:
			connect_dot = false
			child.deselect()

func cur_pos(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 5 * delta)
	if connect_dot:
		global_position = lerp(global_position, rest_point, 5 * delta)
