extends CharacterBody2D


const SPEED = 300.0 * 3
const JUMP_VELOCITY = -400.0

var current_floor = 0

var last_direction_was_left = false

var plantas = {}

func _ready() -> void:
	plantas = {
	2 : $"../Planta+2",
	1 : $"../Planta+1",
	0 : $"../Planta0",
	-1: $"../Planta-1",
	-2: $"../Planta-2",
	}
	position.y = plantas[current_floor].position.y
	
func change_floor_to(floor :int):
	current_floor = floor
	position.y = plantas[current_floor].position.y
	


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if velocity.x < 0:
		$AnimatedSprite2D.play("M" + str(current_floor) + "_walk_left")
		last_direction_was_left = true
	elif velocity.x > 0:
		$AnimatedSprite2D.play("M" + str(current_floor) + "_walk_right")
		last_direction_was_left = false
	else:
		if last_direction_was_left:
			$AnimatedSprite2D.play("M" + str(current_floor) + "_idle_left") #left right
		else :
			$AnimatedSprite2D.play("M" + str(current_floor) + "_idle_right") #left right
			
	move_and_slide()


func _on_button_pressed() -> void:
	change_floor_to(current_floor + 1)


func _on_button_2_pressed() -> void:
	change_floor_to(current_floor - 1)
