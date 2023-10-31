extends Node2D

onready var text_label := $RichTextLabel2
var selected := false
var dot_loc : Area2D = null
var on_loc : bool
var occupied : bool

func _ready():
	text_label.text = str($".")
	
func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 10 * delta)

func _on_body_dot_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("click"):
		selected = not selected
