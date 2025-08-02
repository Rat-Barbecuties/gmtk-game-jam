extends ShapeCast2D

var jump_dust_add = preload("res://jump_dust.tscn")

func _physics_process(delta: float) -> void:
	if  is_colliding():
		if get_collider(0) == Global.player : 
			AudioManager.play_sound(load("res://player/sfx/jump(3).wav"), self.global_position, 0)
			var jump_dust = jump_dust_add.instantiate()
			get_tree().current_scene.add_child(jump_dust)
			jump_dust.global_position = Global.player.global_position
			collide_with_bodies=false
			Global.player.velocity.y = Global.player.JUMP_VELOCITY
			
			
		


func _on_timer_timeout() -> void:
	collide_with_bodies=true
