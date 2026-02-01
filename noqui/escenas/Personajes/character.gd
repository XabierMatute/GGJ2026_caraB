extends Node2D

@export var player : Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_scale = Vector2.ONE * 0.6


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player:
		$AnimatedSprite2D.scale.x = (player.global_position.x - global_position.x) / abs(player.global_position.x - global_position.x) * -1


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		speak()

func speak():
	$Label.visible = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		$Label.visible = false
