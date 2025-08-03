extends Path2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var ghost_grabber: AnimatableBody2D = $ghostGrabber
@onready var ghost_detect: Area2D = $ghostDetect
@onready var ghostmove: RemoteTransform2D = $PathFollow2D/ghostmove

@export var active_mechanism: Node2D

func _ready() -> void:
	if active_mechanism != null:
		if !active_mechanism.is_connected("activated", set_active):
			active_mechanism.connect("activated", set_active)

func _on_ghost_detect_body_entered(body: Node2D) -> void:
	if body is Ghost:
		body.reparent(get_parent())
		ghostmove.remote_path = body.get_path()
		body.stop = true

func set_active(value: bool):
	if value:
		animation_player.play("platformmove",-1,1.5)
	else:
		animation_player.pause()
