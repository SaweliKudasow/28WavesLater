extends CharacterBody2D

@export var speed := 200.0
@export var jump_force := 400.0
@export var gravity := 1000.0

func _physics_process(delta):
	# Гравитация
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Лево / право
	var direction := Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	velocity.x = direction * speed
	
	# Прыжок (только если на земле)
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force
	
	move_and_slide()
