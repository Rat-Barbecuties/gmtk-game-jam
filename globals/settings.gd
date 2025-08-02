extends CanvasLayer

@onready var resolutions: OptionButton = %resolutionOptions
@onready var pause: Control = $base
@onready var transition_anim: AnimationPlayer = $transition_anim

var paused = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if paused:
			pause.hide()
			get_tree().paused = false
		else:
			pause.show()
			get_tree().paused = true
		paused = !paused
		
func scene_transition(scenepath):
	PositionTracker.positions.clear()
	PositionTracker.direction.clear()
	PositionTracker.states.clear()
	AudioManager.play_sound_non_positional(load("res://player/lowDown.ogg"),0)
	transition_anim.play("transition")
	await transition_anim.animation_finished
	get_tree().change_scene_to_file(scenepath)
	transition_anim.play("transition_end")
	
func _on_resolution_options_item_selected(index: int) -> void:
	pass
	#var id = resolutions.get_item_text(index)
	#get_window().set_size(Global.resolutions[id])
	#get_window().set
	#center_window()

func center_window():
	var center_screen  = DisplayServer.screen_get_position() + DisplayServer.screen_get_size()/2
	var window_size = get_window().get_size_with_decorations()
	get_window().set_position(center_screen-window_size/2)


func _on_fullscreen_toggled(toggled_on: bool) -> void:
		match toggled_on:
			true:
				get_window().set_mode(Window.MODE_FULLSCREEN)
			false:
				get_window().set_mode(Window.MODE_WINDOWED)
				center_window()
			_:
				get_window().set_mode(Window.MODE_WINDOWED)
				center_window()
			


func _on_quit_pressed() -> void:
	get_tree().quit()
