extends CenterContainer

onready var game = get_node('/root/Game')


func _disable_buttons():
	var buttons = $Container/Menu.get_children()
	for button in buttons:
		button.disabled = true


func _on_Restart_pressed() -> void:
	_disable_buttons()
	game.restart()


func _on_Exit_pressed() -> void:
	game.exit()

