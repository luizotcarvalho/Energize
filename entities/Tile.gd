extends KinematicBody2D

export var tile_size = 32

var on = false
var is_hover = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("left_click") and is_hover:
		_move_to_free_direction()
		
	elif Input.is_action_just_pressed("arrow_left"):
		_try_to_move_left()

	elif Input.is_action_just_pressed("arrow_right"):
		_try_to_move_right()
		
	elif Input.is_action_just_pressed("arrow_up"):
		_try_to_move_up()
		
	elif Input.is_action_just_pressed("arrow_down"):
		_try_to_move_down()


func _try_to_move_left():
	var left_direction = Vector2(-1 * tile_size, 0)
	return _test_and_move(left_direction)
		
		
func _try_to_move_right():
	var right_direction = Vector2(1 * tile_size , 0)
	return _test_and_move(right_direction)
	

func _try_to_move_up():
	var up_direction = Vector2(0, -1 * tile_size)
	return _test_and_move(up_direction)
	
	
func _try_to_move_down():
	var down_direction = Vector2(0, 1 * tile_size)	
	return _test_and_move(down_direction)
	

func _test_and_move(direction):
	if not test_move(get_global_transform(), direction):
		var tween = $Tween
		tween.interpolate_property(self, "position",
				position, position + direction, 0.1,
				Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
		$Sounds.get_node('Move').play()

		return true
	else: 
		return false
		
	
func _move_to_free_direction():
	if not _try_to_move_left():
		if not _try_to_move_right():
			if not _try_to_move_up():
				_try_to_move_down()
	

func turn_on():
	on = true
	$AnimatedSprite.play('on')

func turn_off():
	on = false
	$AnimatedSprite.play('off')


func _on_tile_mouse_entered() -> void:
	is_hover = true


func _on_tile_mouse_exited() -> void:
	is_hover = false

