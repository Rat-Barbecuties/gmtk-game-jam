extends Area2D

signal activated(value:bool)

@onready var sprite: AnimatedSprite2D = $sprite

var pressed: bool = false 

func update_pressed(value:bool):
	emit_signal("activated", value)
	if value:
		sprite.play("on")
		AudioManager.play_sound(load("res://player/sfx/click(1).wav"),global_position,0)
	else:
		sprite.play("off")
		AudioManager.play_sound(load("res://player/sfx/click(1).wav"),global_position,0)

func _on_body_entered(body: Node2D) -> void:
	if body is Player or body is Ghost:
		pressed = !pressed
		update_pressed(pressed)
