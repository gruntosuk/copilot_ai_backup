extends Node2D

var speed = -600
var direction = Vector2.UP

func _ready() -> void:
	$BulletLifeTime.start()


func _process(delta: float) -> void:
	position.y += speed * delta


func _on_bullet_life_time_timeout() -> void:
	queue_free()
