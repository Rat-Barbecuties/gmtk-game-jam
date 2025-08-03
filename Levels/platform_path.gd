extends Path2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var ghost_grabber: AnimatableBody2D = $ghostGrabber
@onready var ghost_detect: Area2D = $ghostGrabber/ghostDetect
@onready var ghostmove: RemoteTransform2D = $PathFollow2D/ghostmove

@export var active_mechanism: Node2D
@export var activate_on_start: bool = false

func _ready() -> void:
	if active_mechanism != null:
		if !active_mechanism.is_connected("activated", set_active):
			active_mechanism.connect("activated", set_active)
	if activate_on_start:
		animation_player.play("platformmove",-1,1.5)

func _on_ghost_detect_body_entered(body: Node2D) -> void:
	if body is Ghost:
		body.reparent(get_parent())
		ghostmove.remote_path = body.get_path()
		body.stop = true

func set_active(value: bool):
	if !activate_on_start:
		if value:
			animation_player.play("platformmove",-1,1.5)
		else:
			animation_player.pause()
	else:
		if value:
			animation_player.pause()
		else:
			animation_player.play("platformmove",-1,1.5)
	


func _on_ghost_detect_body_exited(body: Node2D) -> void:
	if body is Ghost:
		body.reparent(get_tree().current_scene)
		ghostmove.remote_path = ""
		body.stop = false
