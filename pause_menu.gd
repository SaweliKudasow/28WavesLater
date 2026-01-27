extends Control

@onready var mouse_cursor = $"../../MouseCursor"

func _input(event):
	if event.is_action_pressed("esc_menu"):
		pause()

func _on_exit_button_pressed():
	get_tree().quit()

func _on_play_button_pressed():
	pause()

func pause():
	var paused := !get_tree().paused # paused = остановить/продолжить
	get_tree().paused = paused # останавливаем/продолжаем игру
	visible = paused # включаем/выключаем меню
	mouse_cursor.pause(paused)
