extends Node

onready var game = get_node('/root/Game')


func _disable_buttons():
	var buttons = $Container/Menu.get_children()
	for button in buttons:
		button.disabled = true


func _on_Time_attack_pressed() -> void:
	_disable_buttons()
	game.start_time_attack()


func _on_Zen_pressed() -> void:
	_disable_buttons()
	game.start_zen()
