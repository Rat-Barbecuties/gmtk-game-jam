extends Node

@onready var state_chart: StateChart = $"../../.."
@onready var walk: AudioStreamPlayer2D = $"../../../../walk"

func _on_idle_state_entered() -> void:
	Global.player.animation_player.play("idle")


func _on_idle_state_exited() -> void:
	pass # Replace with function body.


func _on_idle_state_processing(delta: float) -> void:
	Global.player.update_input(delta)
	Global.player.update_velocity(delta)
	
	if Global.player.move_dir != 0 and Global.player.is_on_floor():
		state_chart.send_event("move")
	if Global.player.velocity.y < 0:
		state_chart.send_event("jump")
	if Global.player.velocity.y > 0:
		state_chart.send_event("fall")
