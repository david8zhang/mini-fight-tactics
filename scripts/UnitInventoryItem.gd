class_name UnitInventoryItem
extends Control

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var main = get_node("/root/Main") as Main
var unit: Unit

func _ready():
	animated_sprite_2d.scale = Vector2(2, 2)

func init_from_unit(unit: Unit):
	self.unit = unit
	animated_sprite_2d.sprite_frames = unit.sprite.sprite_frames
	animated_sprite_2d.play(unit.sprite.animation)

func _on_button_pressed():
	main._on_player_unit_in_inventory_clicked(unit, self)

func select():
	animated_sprite_2d.modulate = Color.AQUAMARINE

func deselect():
	animated_sprite_2d.modulate = Color.WHITE
