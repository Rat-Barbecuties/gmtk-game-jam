extends AnimatedSprite2D

func _ready() -> void:
	play("default")

func _on_animation_finished() -> void:
	self.queue_free()
