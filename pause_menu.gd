extends Control

func _input(event):
	if event.is_action_pressed("esc_menu"):
		pause()

func _on_exit_button_pressed():
	get_tree().quit()

func _on_play_button_pressed():
	pause()

func pause():
	var paused := !get_tree().paused
	get_tree().paused = paused # останавливаем/продолжаем игру
	visible = paused # включаем/выключаем меню
	if paused:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
