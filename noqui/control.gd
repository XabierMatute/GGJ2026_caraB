extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = str($Timer.time_left)
	#$Sprite2D.global_rotation = 
	$Sprite2D.global_rotation = $Timer.time_left / 10 * (PI) * - 1 - PI /2
