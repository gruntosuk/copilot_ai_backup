extends CharacterBody2D

var player_direction 
var player_speed = 400

func _physics_process(_delta: float) -> void:
	player_direction = Input.get_axis("move_left", "move_right")
	velocity.x = player_direction * player_speed
	self.position.x = clamp(self.position.x, 0, 650)
	
	move_and_slide()
	
	
