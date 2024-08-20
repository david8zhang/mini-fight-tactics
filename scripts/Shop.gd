class_name Shop
extends Control

@onready var player = get_node("/root/Main/Player") as UnitManager
@onready var main = get_node("/root/Main") as Main
@onready var container = $HBoxContainer as HBoxContainer
@export var store_option_scene: PackedScene

const UNIT_COSTS = {
	Unit.UNIT_TYPE.ARCHER: 2,
	Unit.UNIT_TYPE.SWORDSMAN: 2,
	Unit.UNIT_TYPE.MAGE: 2,
	Unit.UNIT_TYPE.SPEARMAN: 2,
	Unit.UNIT_TYPE.LORD: 3,
	Unit.UNIT_TYPE.HORSEMAN: 3
}

func _ready():
	var all_unit_types = Unit.UNIT_TYPE
	for i in range(0, 4):
#		var random_unit_type = all_unit_types.keys().pick_random()
		var random_unit_type = "ARCHER"

		var unit_type_value = all_unit_types[random_unit_type]
		var unit_cost = UNIT_COSTS[unit_type_value]
		var shop_option = store_option_scene.instantiate() as ShopOption

		container.add_child(shop_option)
		shop_option.shop = self
		shop_option.name_label.text = random_unit_type.capitalize()
		shop_option.price_label.text = str(unit_cost) + "G"
		shop_option.unit_type = unit_type_value
		

func purchase_unit(shop_option: ShopOption):
	shop_option.hide()
	var unit_type = shop_option.unit_type
	var unit = main.instantiate_unit_from_type(unit_type)
	player.add_unit_to_inventory(unit)
