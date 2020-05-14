extends Node2D


func _process(delta: float) -> void:
	_turn_off_tiles()
	_turn_off_finish()
	_reenergy()


func _turn_off_finish():
	$Finish.turn_off()


func _turn_off_tiles():
	var tiles = $Tiles.get_children()
	for tile in tiles:
		tile.turn_off()
		


func _reenergy():
	var start = $Start
	start.reenergize()
