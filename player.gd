extends CharacterBody2D

@export var speed = 300

func _physics_process(delta: float) -> void:
	var input_dir = Input.get_joy_axis(0, JOY_AXIS_LEFT_X)
	print(input_dir)
	
	velocity.x += input_dir
	velocity.y += get_gravity().y * delta
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = -500
		
	if Input.is_action_just_pressed("mitose"):
		var new_player = self.duplicate()
		new_player.velocity.y = -300
		new_player.scale /= 2
		var left_p = new_player.duplicate()
		left_p.velocity.x = -100
		var right_p = new_player.duplicate()
		right_p.velocity.x = 100
		new_player.queue_free()
		get_parent().add_child(left_p)
		get_parent().add_child(right_p)
		queue_free()
	
	move_and_slide()
