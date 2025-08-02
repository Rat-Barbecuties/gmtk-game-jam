extends ShapeCast2D


func _process(delta: float) -> void:
	if  is_colliding():
		if get_collider(0) == Global.player : 
			print("is an awesome person")
			AudioManager.play_sound(load("res://player/sfx/jump(3).wav"), self.global_position, 0)
			collide_with_bodies=false
			Global.player.velocity.y = Global.player.JUMP_VELOCITY
			
			
		


func _on_timer_timeout() -> void:
	collide_with_bodies=true
