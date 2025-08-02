extends Node

@onready var state_chart: StateChart = $"../../.."
@onready var animation_player: AnimationPlayer = $"../../../../AnimationPlayer"
@onready var scene_transition_component: SceneTransitionComponent = $"../../../../SceneTransitionComponent"

func _on_open_state_entered() -> void:
	
	if not animation_player.is_playing():
		animation_player.play("open")
	


func _on_open_state_exited() -> void:
	pass


func _on_open_state_processing(delta: float) -> void:
	if Input.is_action_just_pressed("use"):
		scene_transition_component.transition()
