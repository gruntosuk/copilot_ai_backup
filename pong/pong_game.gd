extends Node2D

@onready var paddle_scene = preload("res://pong/pong_paddle.tscn")
@onready var ball_scene = preload("res://pong/pong_ball.tscn")

var paddle_p1 = Node
var paddle_p2 = Node
var ball = Node

var spawn_player_2 : bool = false

var screen_size : Vector2 = Vector2.ZERO
# Called when the node enters the scene tree for the first time.


func _ready() -> void:
	screen_size = get_viewport_rect().size

	# Connects to the other scripts that will return when they are finishing setting up.
	GlobalEvents.paddle_ready_p1.connect(_spawn_paddle_2)
	GlobalEvents.paddle_ready_p2.connect(_spawn_ball)
	GlobalEvents.ball_ready.connect(_game_ready)

	# Spawn paddle 1
	paddle_p1 = paddle_scene.instantiate()
	add_child(paddle_p1)
	spawn_player_2 = true


func _spawn_paddle_2() -> void:
	if spawn_player_2 == true:
		paddle_p2 = paddle_scene.instantiate()
		add_child(paddle_p2)
		GlobalEvents.set_player_2_paddle.emit()


func _spawn_ball() -> void:
	ball = ball_scene.instantiate()
	add_child(ball)


func _game_ready() -> void:
	print_debug("Game spaned and ready")


func _on_top_border_trigger_zone_area_entered(_area : Area2D) -> void:
	# Placeholder handler to satisfy the scene connection.
	pass