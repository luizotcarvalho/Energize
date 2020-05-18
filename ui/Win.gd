extends CenterContainer

onready var game = get_node('/root/Game')


func _disable_buttons():
	var buttons = $Container/Menu.get_children()
	for button in buttons:
		button.disabled = true


func _on_Play_again_pressed() -> void:
	_disable_buttons()
	game.restart()


func _on_Change_mode_pressed() -> void:
	_disable_buttons()
	game.choose_mode()
