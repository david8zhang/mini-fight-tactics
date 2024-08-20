class_name ArcherUnit
extends Unit

const MAX_HEALTH = 20
const BASE_DAMAGE = 5

func _ready():
	super._ready()
	var config = {
		"base_damage": BASE_DAMAGE,
		"max_health": MAX_HEALTH,
		"unit_type": Unit.UNIT_TYPE.ARCHER
	}
	init(config)
