extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var initial_room = $"Planta-2/Piso-2Izq"
	$Camera2D.position = initial_room.global_position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
