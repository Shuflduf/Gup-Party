extends CharacterBody2D

@export var speed = 300

func _physics_process(delta: float) -> void:
	var input_dir = Input.get_joy_axis(0, JOY_AXIS_LEFT_X)
	print(input_dir)
	
	velocity.x = input_dir * speed
	velocity.y += get_gravity().y * delta
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = -500
	
	move_and_slide()
