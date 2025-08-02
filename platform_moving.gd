extends AnimatableBody2D


@onready var candle: AnimatedSprite2D = $candle

func _ready() -> void:
	candle.play("default")
