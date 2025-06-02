extends CharacterBody2D

@export var speed = 300

var controller_index = 0

func _physics_process(delta: float) -> void:
	var input_dir = 0.0
	if Input.get_connected_joypads().is_empty():
		input_dir = Input.get_axis("left", "right")
	else:
		input_dir = Input.get_joy_axis(controller_index, JOY_AXIS_LEFT_X)
	print(input_dir)
	
	# desmos moment
	var movement_scale = (0.37/(scale.x+0.07)+0.65)
	velocity.x = input_dir * speed * movement_scale
	velocity.y += get_gravity().y * delta
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = -500 * movement_scale
		
	if Input.is_action_just_pressed("mitose"):
		for i in 2:
			var p = self.duplicate()
			p.velocity.y = -300
			p.scale /= 2
			p.velocity.x = 100 * (i * 2 - 1)
			get_parent().add_child(p)
		queue_free()
	
	move_and_slide()
