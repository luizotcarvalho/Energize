extends Node

onready var level_1 = preload("res://scenes/levels/level_1.tscn")

var is_muted = false

func _on_Start_pressed() -> void:
	var instance = level_1.instance()
	var window_center = OS.get_window_size() / 2
	instance.set_global_position(Vector2(window_center.x * 2, window_center.y))
	add_child(instance)
	$Camera2D.set_global_position(Vector2(window_center.x * 2, $Camera2D.get_global_position().y))
	
func _on_Mute_pressed() -> void:
	if is_muted:
		$Music.play()
		is_muted = false
	else:
		$Music.stop()
		is_muted = true

func _on_Exit_pressed() -> void:
	get_tree().quit()
