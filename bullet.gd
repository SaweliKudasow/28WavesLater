extends CharacterBody2D

var speed = 100
var direction = Vector2.RIGHT
var lifetime = 4.5

func _ready():
	# через время удаляем пулю
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _physics_process(_delta):
	velocity = direction * speed
	move_and_slide()
