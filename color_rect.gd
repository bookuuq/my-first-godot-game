extends ColorRect

var speed = 400

func _process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	
	position += direction * speed * delta
	
	var screen_size = get_viewport_rect().size
	position.x = clamp(position.x, 0, screen_size.x - 64)
	position.y = clamp(position.y, 0, screen_size.y - 64)
