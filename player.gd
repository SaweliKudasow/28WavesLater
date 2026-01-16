extends CharacterBody2D

var max_speed = 100   # максимальная скорость
var acceleration = 80 # насколько быстро разгоняемся
var friction = 20     # насколько быстро тормозим

func _physics_process(delta):
	var direction = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		velocity = velocity.move_toward(direction * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
	
	move_and_slide()
	
	# повернуть игрока к курсору
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
	rotation += PI     # разворачиваем, левой стороной
