extends Node

@onready var door: AnimatedSprite2D = $"../../../../door"
@onready var lock: AnimatedSprite2D = $"../../../../lock"

func _on_closed_state_entered() -> void:
	lock.visible=true
	door.play("open",-1,true)
	lock.play("default",-1,true)


func _on_closed_state_exited() -> void:
	pass # Replace with function body.


func _on_closed_state_processing(delta: float) -> void:
	pass # Replace with function body.
