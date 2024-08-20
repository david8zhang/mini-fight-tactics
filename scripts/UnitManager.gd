class_name UnitManager
extends Node

const DEFAULT_HEALTH = 20

@onready var main = get_node("/root/Main") as Main

var health = 0
var gold = 100
var units_on_field = []
var unit_inventory = []

signal unit_added_to_inventory(unit)

# Called when the node enters the scene tree for the first time.
func _ready():
	health = DEFAULT_HEALTH

func add_unit_to_field(unit: Unit):
	units_on_field.append(unit)
	var team_grid = main.team_grid as TeamGrid

func add_unit_to_inventory(unit: Unit):
	add_child(unit)
	unit_inventory.append(unit)
	unit_added_to_inventory.emit(unit)
