class_name Unit
extends Node2D

enum UNIT_TYPE {
	ARCHER,
	LORD,
	SWORDSMAN,
	SPEARMAN,
	MAGE,
	HORSEMAN
}

@onready var sprite = get_node("AnimatedSprite2D") as AnimatedSprite2D
@onready var button = get_node("Button") as Button

var unit_manager: UnitManager
var max_health: int = 0
var damage: int = 0
var upgrade_level: int = 0
var unit_type: UNIT_TYPE

func _ready():
	sprite.scale = Vector2(2, 2)
	button.pressed.connect(unit_clicked)

func init(config := {}):
	max_health = config["max_health"]
	damage = config["base_damage"]
	unit_type = config["unit_type"] as UNIT_TYPE

func unit_clicked():
	print("Clicked unit!")
