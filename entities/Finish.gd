extends Area2D

const FINISH_TILESET_ON_INDEX = 9
const FINISH_TILESET_OFF_INDEX = 8

onready var game = get_node('/root/Game')
var on = false

func _change_tileset_state(state, old_state):
	var tilemap = get_owner().get_node('TileMap')
	var used_cells = tilemap.get_used_cells()
	
	for cell in used_cells:
		var cell_index = tilemap.get_cellv(cell)
		if cell_index == old_state:
			tilemap.set_cell(cell.x, cell.y, state)


func turn_on() -> void:
	on = true
	_change_tileset_state(FINISH_TILESET_ON_INDEX, FINISH_TILESET_OFF_INDEX)
	game.next_level()


func turn_off() -> void:
	on = false
	_change_tileset_state(FINISH_TILESET_OFF_INDEX, FINISH_TILESET_ON_INDEX)
	
	

