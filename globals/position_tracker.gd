extends Node

var positions: Array[Vector2]
var states: Array[String]
var direction: Array[float]
var ghost_add = preload("res://globals/ghost.tscn")
var ghost
var current := 0
const ARRAY_MAX_SIZE = 700

###########
# commented out code is for circular queue of positions, current is for unlimited positions
###########
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ghost"):
		
		if get_tree().get_first_node_in_group("ghost") != null:
			var ghost_existing = get_tree().get_first_node_in_group("ghost")
			ghost_existing.queue_free()
		ghost = ghost_add.instantiate()
		get_tree().current_scene.add_child(ghost)
		ghost.positions = positions.duplicate()
		ghost.states = states.duplicate()
		ghost.direction = direction.duplicate()
		positions.clear()
		states.clear()
		direction.clear()
		
	if event.is_action_pressed("reset_ghost"):
		if get_tree().get_first_node_in_group("ghost") != null:
			var ghost_existing = get_tree().get_first_node_in_group("ghost")
			ghost_existing.queue_free()
			positions.clear()
			states.clear()
			direction.clear()
		
func _process(delta: float) -> void:
	positions.append(Global.player.global_position)
	states.append(Global.player.state_chart._state._active_state.name)
	direction.append(Global.player.move_dir)


#func _input(event: InputEvent) -> void:
	#if event.is_action_pressed("ghost"):
		#if get_tree().get_first_node_in_group("ghost") != null:
			#var ghost_existing = get_tree().get_first_node_in_group("ghost")
			#ghost_existing.queue_free()
		#
		#var array = positions.slice(current+1)
		#array.append_array(positions.slice(0,current))
		#
		#ghost = ghost_add.instantiate()
		#get_tree().current_scene.add_child(ghost)
		#ghost.positions = array
		#positions.clear()
		
#func _process(delta: float) -> void:
	#if positions.size() > ARRAY_MAX_SIZE:
		#current = wrapi(current+1 , 0, ARRAY_MAX_SIZE)
		#positions[current] = Global.player.global_position
	#else:
		#positions.append(Global.player.global_position)
		#current = positions.size()-1
