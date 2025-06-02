extends SoftBody2D

func _physics_process(delta: float) -> void:
	var input_dir = Input.get_axis("left", "right")
	
	position.x += input_dir
