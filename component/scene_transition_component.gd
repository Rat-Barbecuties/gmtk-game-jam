class_name SceneTransitionComponent

extends Node2D

signal scene_transition(scene)
@export_file("*.tscn") var scene_path_to_transition_to: String

func transition():
	GlobalUi.scene_transition(scene_path_to_transition_to)

func _on_health_component_died() -> void:
	GlobalUi.scene_transition(scene_path_to_transition_to)

func _on_area_2d_body_entered(body: Node2D) -> void:
	GlobalUi.scene_transition(scene_path_to_transition_to)

func _on_dying_last_checkpoint() -> void:
	GlobalUi.scene_transition(Global.checkpoint)
