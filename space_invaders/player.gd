extends CharacterBody2D

var player_direction 
var player_speed = 400

var default_bullet = preload("res://default_bullet.tscn")


func _physics_process(_delta: float) -> void:
	player_direction = Input.get_axis("move_left", "move_right")
	velocity.x = player_direction * player_speed
	self.position.x = clamp(self.position.x, 0, 1100)
	
	move_and_slide()
	
	if Input.is_action_just_pressed("fire"):
		shoot_weapon()


func shoot_weapon() -> void:
	var default_bullet_instance = default_bullet.instantiate()
	default_bullet_instance.global_position = $Gun.global_position
	get_tree().root.add_child(default_bullet_instance)
	
