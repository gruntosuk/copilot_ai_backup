extends CharacterBody2D

var ball_start_position : Vector2= Vector2(556, 300)
var ball_direction : Vector2 = Vector2(0, 0)
var ball_speed : float = 800
var rng_direction : int = 0


func _ready() -> void:
	position = ball_start_position
	
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


func _physics_process(_delta: float) -> void:
	# Vector math for ball movement.
	velocity = ball_direction * ball_speed
	move_and_slide()



