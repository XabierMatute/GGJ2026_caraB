extends Node2D

@export var player : Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_scale = Vector2.ONE * 0.6


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scale.x = (player.global_position.x - global_position.x) / abs(player.global_position.x - global_position.x) * -1
