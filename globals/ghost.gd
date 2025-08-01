extends Node2D

var positions: Array[Vector2]
var iterator := 0

	
func _process(delta: float) -> void:
	if !positions.is_empty() and iterator <= positions.size()-1:
		global_position = positions[iterator]
		iterator += 1
	else:
		get_tree().create_timer(1).timeout.connect(func(): self.queue_free())
		
