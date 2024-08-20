class_name TeamGrid
extends TileMap

@onready var main = get_node("/root/Main") as Main
@export var team_grid_cell_scene: PackedScene
var team_grid_cells = []

# Called when the node enters the scene tree for the first time.
func _ready():
	var tile_size = tile_set.tile_size
	var tile_map_rect = get_used_rect().size
	var total_rows = tile_map_rect.y
	var total_cols = tile_map_rect.x
	
	var row_start = 15
	var row_end = total_rows - 15
	
	var col_start = 16
	var col_end = total_cols - 16
	
	var cell_size = 64
	
	var num_cell_rows = ((row_end - row_start) * tile_size.y) / cell_size
	var num_cell_cols = ((col_end - col_start) * tile_size.x) / cell_size

	var start_x = col_start * tile_size.x
	var start_y = row_start * tile_size.y
	var x = 0
	var y = 0
	
	for i in range(0, num_cell_cols + 1):
		for j in range(0, num_cell_rows + 1):
			x = start_x + cell_size * i
			y = start_y + cell_size * j
			var team_grid_cell = team_grid_cell_scene.instantiate() as TeamGridCell
			team_grid_cell.global_position = Vector2(x, y)
			add_child(team_grid_cell)
			team_grid_cells.append(team_grid_cell)

func place_unit(key: String):
	pass
