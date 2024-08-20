class_name UnitInventory
extends Control

@export var unit_inventory_item_scene: PackedScene
@onready var h_box_container = $HBoxContainer

func add_unit_to_inventory(unit: Unit):
	var unit_inventory_item = unit_inventory_item_scene.instantiate() as UnitInventoryItem
	h_box_container.add_child(unit_inventory_item)
	unit_inventory_item.init_from_unit(unit)

