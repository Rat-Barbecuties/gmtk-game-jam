extends Node

@onready var state_chart: StateChart = $"../../.."

var land_dust_add = preload("res://land_dust.tscn")

func _on_falling_state_entered() -> void:
	Global.player.animation_player.play("fall")


func _on_falling_state_exited() -> void:
	AudioManager.play_sound(load("res://player/sfx/land.wav"), Global.player.global_position, 0)
	var land_dust = land_dust_add.instantiate()
	get_tree().current_scene.add_child(land_dust)
	land_dust.global_position = Global.player.global_position
	Global.player.jump_used = false


func _on_falling_state_processing(delta: float) -> void:
	Global.player.update_input(delta)
	Global.player.update_velocity(delta)
	
	if Global.player.is_on_floor():
		state_chart.send_event("move")
