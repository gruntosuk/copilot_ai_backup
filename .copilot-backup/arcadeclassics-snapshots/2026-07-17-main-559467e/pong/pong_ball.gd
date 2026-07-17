extends Node2D

var ball_spawn : Vector2i = Vector2i(556, 300)
var ball_direction : Vector2 = Vector2i(0, 0)
var ball_speed : float = 800
var rng_direction : int = 0
var paddle_size : Vector2 = Vector2.ZERO
var paddle_rect : Rect2 


func _ready() -> void:
	GlobalEvents.pong_paddle_size.connect(_set_paddle_size)

	position = ball_spawn

	if paddle_rect.has_point(position):
		print("Ball has hit paddle")
	
	# Change the seed each time the ball spawns so it is truly random.
	randomize()

	# Gets a random number and then sets the ball_direction so its movement is randomised when it spawns.
	rng_direction = randi_range(0, 5)
	if rng_direction == 0: 
		ball_direction = Vector2(1, 0) # Move east at the start
	elif rng_direction == 1:
		ball_direction = Vector2(-1, 0)  # Move west at the start
	elif rng_direction == 2:
		ball_direction = Vector2(-1, -1)  # Move south west at the start
	elif rng_direction == 3:
		ball_direction = Vector2(1, -1)  # Move south east at the start
	elif rng_direction == 4:
		ball_direction = Vector2(-1, 1)  # Move north west at the start
	elif rng_direction == 5:
		ball_direction = Vector2(1, 1)  # Move north east at the start

	GlobalEvents.ball_ready.emit()


func _physics_process(delta: float) -> void:
	# Vector math for ball movement.
	position  += ball_direction * ball_speed * delta


func _on_trigger_zone_area_entered(area : Area2D) -> void:
	var root_node = area.get_parent()

	if root_node.is_in_group("pong_paddle"):
		print_debug("Hit paddle")
		pass
		# DISABLED(2026-07-16): Re-enable when bounce logic is restored in _ball_collision().
		# _ball_collision()
	
	if area.is_in_group("pong_border"):
		print_debug("Hit wall")
		pass
		# DISABLED(2026-07-16): Re-enable when wall bounce handling is restored.
		# _ball_collision()

	if root_node.is_in_group("red_score_zone"):
		print_debug("Blue scored!")

	if root_node.is_in_group("blue_score_zone"):
		print_debug("Red scored!")


func _set_paddle_size(new_paddle_size) -> void:
	paddle_size = new_paddle_size
