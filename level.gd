extends Node2D


@export var start_pos: Marker2D
@export var player: Player

func _ready() -> void:
	player.global_position = start_pos.global_position

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ghost"):
		player.global_position = start_pos.global_position
