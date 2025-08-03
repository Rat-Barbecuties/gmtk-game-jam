extends Node

@onready var animation_player: AnimationPlayer = $"../../../../AnimationPlayer"

func _on_death_state_entered() -> void:
	HitStop.hit_stop(.25,1)
	AudioManager.play_sound(load("res://player/sfx/hitHurt(4).wav"),Global.player.global_position,0)
	Global.camera.apply_shake()
	animation_player.play("death")
	get_tree().create_timer(2).timeout.connect(func(): GlobalUi.restart())


func _on_death_state_exited() -> void:
	pass # Replace with function body.


func _on_death_state_processing(delta: float) -> void:
	pass # Replace with function body.
