class_name Ghost

extends Node2D

@onready var sprite: AnimatedSprite2D = $sprite
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var positions: Array[Vector2]
var states: Array[String]
var direction: Array[float]

var previous_state: String
var current_state: String: set = update_ghost_state

var iterator := 0

func _ready() -> void:
	Global.ghost = self
	
func _process(delta: float) -> void:
	
	if !positions.is_empty() && iterator <= positions.size()-1 && iterator <= states.size()-1 && iterator <= direction.size()-1:
		previous_state = states[iterator-1]
		if states[iterator] != states[iterator-1]:
			current_state = states[iterator]
		if direction[iterator] == -1:
			sprite.flip_h = true
		if direction[iterator] == 1:
			sprite.flip_h = false
		global_position = positions[iterator]
		iterator += 1

func update_ghost_state(current_state: String):
	match current_state:
		"idle":
			sprite.play("idle")
		"move":
			sprite.play("move")
		"jump":
			sprite.play("jump")
		"falling":
			sprite.play("fall")
