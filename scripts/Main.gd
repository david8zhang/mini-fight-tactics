class_name Main
extends Node2D

@onready var player = $Player as UnitManager
@onready var player_health_label = $UI/UI/Health as Label
@onready var player_gold_label = $UI/UI/Gold as Label
@onready var unit_inventory = $UI/VBoxContainer/UnitInventory as UnitInventory
@onready var team_grid = $TileMap as TeamGrid

@export var archer_scene: PackedScene
@export var swordsman_scene: PackedScene
@export var mage_scene: PackedScene
@export var spearman_scene: PackedScene
@export var horseman_scene: PackedScene
@export var lord_scene: PackedScene

var selected_unit_in_inventory

# Called when the node enters the scene tree for the first time.
func _ready():
	player_health_label.text = "HP: " + str(player.health)
	player_gold_label.text = "Gold: " + str(player.gold)

func instantiate_unit_from_type(unit_type: Unit.UNIT_TYPE):
	var unit_scene
	match unit_type:
		Unit.UNIT_TYPE.ARCHER:
			unit_scene = archer_scene
		Unit.UNIT_TYPE.SWORDSMAN:
			unit_scene = swordsman_scene
		Unit.UNIT_TYPE.MAGE:
			unit_scene = mage_scene
		Unit.UNIT_TYPE.LORD:
			unit_scene = lord_scene
		Unit.UNIT_TYPE.SPEARMAN:
			unit_scene = spearman_scene
		Unit.UNIT_TYPE.HORSEMAN:
			unit_scene = horseman_scene
	return unit_scene.instantiate() as Unit
	
func add_unit_to_field(unit: Unit):
	player.add_unit_to_field(unit)


func _on_player_unit_added_to_inventory(unit):
	unit_inventory.add_unit_to_inventory(unit)

func _on_player_unit_in_inventory_clicked(unit: Unit, unit_inventory_item: UnitInventoryItem):
	if selected_unit_in_inventory != null:
		selected_unit_in_inventory.deselect()
	selected_unit_in_inventory = unit_inventory_item
	selected_unit_in_inventory.select()
