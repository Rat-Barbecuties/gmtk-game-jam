extends Path2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var ghost_grabber: AnimatableBody2D = $ghostGrabber
@onready var ghost_detect: Area2D = $ghostDetect
@onready var ghostmove: RemoteTransform2D = $PathFollow2D/ghostmove


func _on_ghost_detect_body_entered(body: Node2D) -> void:
	if body is Ghost:
		animation_player.play("platformmove")
		body.reparent(get_parent())
		ghostmove.remote_path = body.get_path()
		body.stop = true
