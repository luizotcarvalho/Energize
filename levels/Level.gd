extends Node


func _ready() -> void:
	pass
#	_shuffle_tiles()


func _process(_delta: float) -> void:
	_turn_off_tiles()
	_turn_off_finish()
	_reenergy()


func _shuffle_tiles() -> void:
	var new_tiles_positions = []
	var tiles = $Tiles.get_children()
	
	for tile in tiles:
		new_tiles_positions.append(tile.position)
	
	new_tiles_positions.shuffle()
	
	for index in range(tiles.size()):
		tiles[index].position = new_tiles_positions[index]
	


func _turn_off_finish():
	$Finish.turn_off()


func _turn_off_tiles():
	var tiles = $Tiles.get_children()
	for tile in tiles:
		tile.turn_off()
		


func _reenergy():
	var start = $Start
	start.reenergize()
