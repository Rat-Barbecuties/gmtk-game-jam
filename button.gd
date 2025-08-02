extends StaticBody2D

signal activated(value:bool)

@onready var sprite: AnimatedSprite2D = $sprite
@onready var timer: Timer = $Timer
@onready var interact: Area2D = $interact

var pressed: bool = false : set=update_pressed

func update_pressed(value:bool):
	emit_signal("activated", value)
	AudioManager.play_sound(load("res://player/sfx/click(1).wav"), self.global_position, 0)
	AudioManager.play_sound_normal(load("res://player/sfx/powerUp(1).wav"), self.global_position, 0)
	
	if value :
		sprite.play("pressed")
	else:
		sprite.play("default")


func _on_interact_body_entered(body: Node2D) -> void:
	
	if body is Player or body is Ghost:

		##timer.start()
		pressed = true
		

func _on_interact_body_exited(body: Node2D) -> void:

	if body is Player or body is Ghost:
		##timer.start()
		pressed = false

func _on_timer_timeout() -> void:
	if interact.has_overlapping_bodies():
		if interact.overlaps_body(Global.player) or interact.overlaps_body(Global.ghost):
			pressed = true
			

			
	else:
		pressed = false
	
