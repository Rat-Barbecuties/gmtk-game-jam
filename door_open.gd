extends Node

@onready var state_chart: StateChart = $"../../.."
@onready var door: AnimatedSprite2D = $"../../../../door"
@onready var lock: AnimatedSprite2D = $"../../../../lock"

func _on_open_state_entered() -> void:
	lock.play("default")
	lock.visible = false
	door.play("open")


func _on_open_state_exited() -> void:
	pass


func _on_open_state_processing(delta: float) -> void:
	pass # Replace with function body.
