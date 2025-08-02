extends Node

@onready var animation_player: AnimationPlayer = $"../../../../AnimationPlayer"
@onready var state_chart: StateChart = $"../../.."


func _on_loop_state_entered() -> void:
	HitStop.hit_stop(.25,1)
	AudioManager.play_sound(load("res://player/sfx/timestop.wav"),Global.player.global_position, 0)
	AudioManager.play_sound(load("res://player/sfx/timestop1.wav"),Global.player.global_position, 0)
	Global.camera.apply_shake()
	animation_player.play("loop")
	await animation_player.animation_finished
	state_chart.send_event("idle")


func _on_loop_state_exited() -> void:
	AudioManager.play_sound(load("res://player/sfx/hitHurt(2).wav"),Global.player.global_position, 0)


func _on_loop_state_processing(delta: float) -> void:
	Global.player.update_velocity(delta)
