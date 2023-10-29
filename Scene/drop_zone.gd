extends Position2D

var occupied = false

func _draw():
	draw_circle(Vector2.ZERO, 10, Color.slategray)

func select():
	for child in get_tree().get_nodes_in_group("zone"):
		child.deselect()
	modulate = Color.darkslategray

func deselect():
	modulate = Color.slategray
