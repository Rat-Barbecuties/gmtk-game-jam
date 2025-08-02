extends Node

@onready var animation_player: AnimationPlayer = $"../../../../AnimationPlayer"


func _on_closed_state_entered() -> void:
	if not animation_player.is_playing():
		animation_player.play("close")
	


func _on_closed_state_exited() -> void:
	pass # Replace with function body.


func _on_closed_state_processing(delta: float) -> void:
	pass # Replace with function body.
