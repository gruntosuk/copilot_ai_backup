extends StaticBody2D

var is_player_2 : bool = false
var paddle_spawn_p1 : Vector2i = Vector2i(0, 240)
var paddle_spawn_p2 : Vector2i = Vector2i(1120, 240)
var paddle_size : Vector2 = Vector2.ZERO
var p1_paddle_speed : float = 600
var p2_paddle_speed : float = 600
var y_direction : Vector2 = Vector2.ZERO
var max_y : float = 432
var min_y : float = 16


func _ready() -> void:
	# Sets the paddle size var to the actual asset sizs and then sends out a signal
	paddle_size = $Paddle.size
	GlobalEvents.pong_paddle_size.emit(paddle_size)

	if is_player_2 == false:
		position = paddle_spawn_p1
		print("Paddle one ready")
		GlobalEvents.paddle_ready_p1.emit()
	else:
		$Paddle.color = Color(0, 0, 255, 255)
		position = paddle_spawn_p2
		GlobalEvents.paddle_ready_p2.emit()


func _process(delta: float) -> void:
	if is_player_2 == false:
		var input_direction = Input.get_axis("p1_move_up", "p1_move_down")
		position.y += input_direction * p1_paddle_speed * delta
		position.y = clamp(position.y, min_y, max_y)
	else:
		var input_direction = Input.get_axis("p2_move_up", "p2_move_down")
		position.y += input_direction * p2_paddle_speed * delta
		position.y = clamp(position.y, min_y, max_y)


# DISABLED(2026-07-16): Replaced by is_player_2 flag set before add_child in pong_game._spawn_paddle_2().
# func _player_2_paddle() -> void: ...
