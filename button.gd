extends StaticBody2D

signal activated(value:bool)

@onready var sprite: AnimatedSprite2D = $sprite
@onready var timer: Timer = $Timer
@onready var interact: Area2D = $interact

var pressed: bool = false

func _on_interact_body_entered(body: Node2D) -> void:
	if body is Player or body is Ghost:
		timer.start()
		

func _on_interact_body_exited(body: Node2D) -> void:
	if body is Player or body is Ghost:
		timer.start()



func _on_timer_timeout() -> void:
	if interact.has_overlapping_bodies():
		if interact.overlaps_body(Global.player) or interact.overlaps_body(Global.ghost):
			pressed = true
			sprite.play("pressed")
			emit_signal("activated", true)
			AudioManager.play_sound(load("res://player/sfx/click(1).wav"), self.global_position, 0)
			AudioManager.play_sound_normal(load("res://player/sfx/powerUp(1).wav"), self.global_position, 0)
	else:
		pressed = false
		sprite.play("default")
		emit_signal("activated", false)
		AudioManager.play_sound(load("res://player/sfx/click(1).wav"), self.global_position, 0)
		AudioManager.play_sound_normal(load("res://player/sfx/powerUp(2).wav"), self.global_position, 0)
