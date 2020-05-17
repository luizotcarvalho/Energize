extends Node

onready var game = get_node('/root/Game')

func _disable_buttons():
	var buttons = $Container/Menu.get_children()
	for button in buttons:
		button.disabled = true

func _on_Start_pressed() -> void:
	_disable_buttons()
	game.start()


func _update_mute_label():
	if game.is_muted:
		$Container/Menu/Mute.text = 'Unmute music'
	else:
		$Container/Menu/Mute.text = 'Mute music'
	
	
func _on_Mute_pressed() -> void:
	game.toggle_mute()
	_update_mute_label()


func _on_Exit_pressed() -> void:
	game.exit()
