extends Node

@onready var state_chart: StateChart = $"../../.."
@onready var animation_player: AnimationPlayer = $"../../../../AnimationPlayer"
@onready var scene_transition_component: SceneTransitionComponent = $"../../../../SceneTransitionComponent"
@onready var interact: Area2D = $"../../../../interact"

var used: bool = false

func _on_open_state_entered() -> void:
	if not animation_player.is_playing():
		animation_player.play("open")

func _on_open_state_exited() -> void:
	pass

func _on_open_state_processing(delta: float) -> void:
	if interact.overlaps_body(Global.player) && !used:
		used = true
		AudioManager.play_sound_non_positional(load("res://player/kenney_impact-sounds/Audio/threeTone2.ogg"),0)
		Global.player.state_chart.send_event("door")
		get_tree().create_timer(1).timeout.connect(func():scene_transition_component.transition())
		
