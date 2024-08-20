class_name TeamGridCell
extends Node2D
@onready var button = $Button
@onready var main: Main = get_node("/root/Main") as Main

func _ready():
	button.set_size(Vector2(64, 64))
	button.position = Vector2(-32, -32)
	button.modulate = Color(0, 0, 0, 0)

func _draw():
	var rect = Rect2(-32, -32, 64, 64)
	draw_rect(rect, Color.AQUA, false, 1.0)

func _process(delta: float):
	queue_redraw()


func _on_button_pressed():
	pass
