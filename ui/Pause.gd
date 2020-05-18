extends CenterContainer

onready var game = get_node('/root/Game')


func _ready() -> void:
	_update_mute_label()


func _update_mute_label():
	if game.is_muted:
		$Menu/Mute.text = 'Unmute music'
	else:
		$Menu/Mute.text = 'Mute music'


func _disable_buttons():
	var buttons = $Menu.get_children()
	for button in buttons:
		button.disabled = true


func _on_Continue_pressed() -> void:
	game.resume()


func _on_Mute_pressed() -> void:
	game.toggle_mute()
	_update_mute_label()


func _on_Restart_pressed() -> void:
	_disable_buttons()
	game.restart()


func _on_Change_Mode_pressed() -> void:
	game.choose_mode()
