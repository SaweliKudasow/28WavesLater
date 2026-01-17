extends CharacterBody2D

var speed = 300
var direction = Vector2.RIGHT

func _physics_process(_delta):
	velocity = direction * speed
	move_and_slide()
