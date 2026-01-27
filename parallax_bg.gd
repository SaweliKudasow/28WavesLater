extends TileMapLayer

@export var intensity := 10.0
@export var smoothness := 5.0 # чем меньше — тем медленнее реакция

var start_pos: Vector2

func _ready():
	start_pos = position

func _process(delta):
	var viewport_size = get_viewport().get_visible_rect().size
	var mouse_pos = get_viewport().get_mouse_position()
	
	var offset = (mouse_pos - viewport_size / 2) / viewport_size
	var target_pos = start_pos + offset * intensity
	
	# плавно догоняем цель
	position = position.lerp(target_pos, delta * smoothness)
