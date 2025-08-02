extends Node

@onready var animation_player: AnimationPlayer = $"../../../../AnimationPlayer"


func _on_door_state_entered() -> void:
	animation_player.play("door")


func _on_door_state_exited() -> void:
	pass # Replace with function body.


func _on_door_state_physics_processing(delta: float) -> void:
	pass # Replace with function body.
