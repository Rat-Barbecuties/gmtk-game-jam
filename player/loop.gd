extends Node

@onready var animation_player: AnimationPlayer = $"../../../../AnimationPlayer"
@onready var state_chart: StateChart = $"../../.."


func _on_loop_state_entered() -> void:
	AudioManager.play_sound(load("res://player/sfx/timestop.wav"),Global.player.global_position, 0)
	AudioManager.play_sound(load("res://player/sfx/timestop1.wav"),Global.player.global_position, 0)
	Global.camera.apply_shake()
	animation_player.play("loop")
	await animation_player.animation_finished
	state_chart.send_event("idle")


func _on_loop_state_exited() -> void:
	pass # Replace with function body.


func _on_loop_state_processing(delta: float) -> void:
	pass # Replace with function body.
