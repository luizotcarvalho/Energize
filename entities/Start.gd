extends Area2D


func reenergize() -> void:
	var connectors = get_overlapping_areas()
	
	if connectors:
		energize(connectors.front())


func energize(energized_connector: Area2D) -> void:
	if energized_connector.get_name() == 'Finish':
		if not energized_connector.on:
			energized_connector.turn_on()
		return
	
	var tile = energized_connector.get_owner()
	tile.turn_on()
	
	var connectors = tile.get_node('Connectors').get_children()
	connectors.erase(energized_connector)
	
	var connectors_clone = connectors.duplicate()
	for connector in connectors_clone:
		var collisor = connector.get_node('CollisionShape2D')
		if collisor.disabled:
			connectors.erase(connector)
	
	var parent_conectors = connectors.front().get_overlapping_areas()
	
	if parent_conectors:
		energize(parent_conectors.front())

