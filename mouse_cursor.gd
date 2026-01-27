extends Node2D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(_delta):
	global_position = get_viewport().get_mouse_position()

func pause(paused):
	if paused:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		self.hide()
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		self.show()
