extends Node2D

@onready var door: AnimatedSprite2D = $door
@onready var lock: AnimatedSprite2D = $lock
@onready var scene_transition_component: SceneTransitionComponent = $SceneTransitionComponent

@export var is_locked: bool


func _ready() -> void:
	match is_locked:
		false:
			unlock()
		true:
			lock_door()
			
func unlock():
	lock.play("default")
	await lock.animation_finished
	lock.visible = false
	
func lock_door():
	lock.play("default",-1,true)
			
		
