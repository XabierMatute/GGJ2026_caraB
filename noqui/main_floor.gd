extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_player_elevator_up() -> void:
	var tween: Tween = create_tween()

	tween.tween_property($Player/Sprite2D, "modulate:a", 0, 0.5)
	#tween.parallel().tween_property($Camera2D, "offset:y", $Despacho.position.y, 1)
	tween.parallel().tween_property($Camera2D, "position:y", $Despacho.position.y, 1)
	#tween.parallel().tween_property($Camera2D, "Position.y", , 1)
	tween.parallel().tween_property($PlantaS, "modulate:a", 0.5, 1)
	tween.parallel().tween_property($Despacho, "modulate", Color.WHITE, 1)
	#await tween.finished
	tween.tween_property($Player/Sprite2D, "modulate:a", 1, 0.5)
	
	#$Player.position.y = $Despacho.position.y - 1000
	

	
	
