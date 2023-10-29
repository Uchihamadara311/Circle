extends Node2D

onready var text_label := $RichTextLabel2
var selected := false
var dot_loc : Area2D = null
var on_loc : bool

func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 5 * delta)

func _on_body_dot_input_event(_viewport, _event, _shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and not event.pressed:
			selected = false
			text_label.text = "Bruh"
	
