extends Node

@onready var state_chart: StateChart = $"../../.."

func _on_move_state_entered() -> void:
	Global.player.animation_player.play("move")
	


func _on_move_state_exited() -> void:
	pass # Replace with function body.


func _on_move_state_processing(delta: float) -> void:
		
	Global.player.update_input(delta)
	Global.player.update_velocity(delta)
	
	if Global.player.move_dir == 0:
		state_chart.send_event("idle")
	if Global.player.velocity.y < 0:
		state_chart.send_event("jump")
	if !Global.player.is_on_floor():
		state_chart.send_event("fall")
