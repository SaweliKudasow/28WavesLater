extends CharacterBody2D

var max_speed = 100   # максимальная скорость
var acceleration = 80 # насколько быстро разгоняемся
var friction = 20     # насколько быстро тормозим
@onready var anim = $OnShootAnim
@onready var appear_anim = $OnAppearAnim
var start = false
var bullet = preload("res://bullet.tscn")

func _ready():
	appear_anim.play("appear")

func _physics_process(delta):
	# останавливаем движение если игра не началась
	if not start:
		return
	
	# движение
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
	
	rotate_player()
	on_shoot()
	walls_loop()

func _on_shoot_animation_finished():
	anim.stop()
	anim.frame = 0

func rotate_player():
	# повернуть игрока к курсору
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)
	rotation += PI     # разворачиваем, левой стороной

func on_shoot():
	# если лкм зажата & анимация не играет
	if Input.is_action_pressed("shoot") and not anim.is_playing():
		anim.play("attack") # запуск анимации выстрела
		shoot()             # выстрел пули

func shoot():
	# добавляем пулю на сцену
	var bullet_instance = bullet.instantiate()
	get_parent().add_child(bullet_instance)
	
	# ставим пулю в позицию игрока
	bullet_instance.global_position = global_position
	
	# направление к мыши
	var mouse_pos = get_global_mouse_position()
	var dir = (mouse_pos - global_position).normalized()
	
	# поворачиваем пулю левой стороной
	bullet_instance.direction = dir
	bullet_instance.rotation = dir.angle() + PI

func walls_loop():
	# экранный перенос
	var screen_size = get_viewport_rect().size
	var center = screen_size / 2
	
	if position.x < 0 or position.x > screen_size.x or position.y < 0 or position.y > screen_size.y:
		position = center + (center - position)

func _on_appear_anim_finished():
	anim.show()
	appear_anim.hide()
	start = true
