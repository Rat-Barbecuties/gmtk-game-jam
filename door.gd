extends Node2D

@onready var door: AnimatedSprite2D = $door
@onready var lock: AnimatedSprite2D = $lock
@onready var scene_transition_component: SceneTransitionComponent = $SceneTransitionComponent
@onready var interact: Area2D = $interact

@onready var state_chart: StateChart = $StateChart

@export var is_locked: bool = false
@export var unlock_mechanism: Node2D

func _ready() -> void:
	if unlock_mechanism != null:
		if !unlock_mechanism.is_connected("activated", unlock_disconnected):
			unlock_mechanism.connect("activated", unlock_disconnected)
			
	if !is_locked:
		state_chart._state

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("use") && interact.overlaps_body(Global.player):
		if is_locked && Global.player.has_key:
			state_chart.send_event("open")
			

func unlock_disconnected(value: bool):
	if value:
		state_chart.send_event("open")
	else:
		state_chart.send_event("close")
