extends Node2D


@export var start_pos: Marker2D
@export var player: Player

func _ready() -> void:
	player.global_position = start_pos.global_position
