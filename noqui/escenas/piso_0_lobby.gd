extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		var tween: Tween = create_tween()
		tween.tween_property($"../../Camera2D", "position", global_position, 1)
		tween.parallel().tween_property($"../../Camera2D", "zoom", Vector2.ONE / 5, 2)
		tween.parallel().tween_property(self, "modulate", Color.WHITE, 1)




func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		var tween: Tween = create_tween()
		tween.parallel().tween_property(self, "modulate", Color("#616161"), 1)
		#tween.parallel().tween_property($"../../Camera2D", "zoom", Vector2.ONE / 2, 1)
