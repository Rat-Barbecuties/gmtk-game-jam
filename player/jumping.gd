extends Node

@onready var state_chart: StateChart = $"../../.."

func _on_jump_state_entered() -> void:
	Global.player.animation_player.play("jump")
	AudioManager.play_sound(load("res://player/sfx/jump(2).wav"), Global.player.global_position, 0)


func _on_jump_state_exited() -> void:
	pass # Replace with function body.


func _on_jump_state_processing(delta: float) -> void:
	if Global.player.is_on_floor():
		state_chart.send_event("move")
	if Global.player.velocity.y > 0:
		state_chart.send_event("fall")
	
	Global.player.update_input(delta)
	Global.player.update_velocity(delta)
