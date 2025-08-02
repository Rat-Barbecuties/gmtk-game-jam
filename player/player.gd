class_name Player
extends CharacterBody2D

@onready var state_chart: StateChart = $StateChart
@onready var sprite: Sprite2D = $sprite
@onready var hurtbox_component: HurtboxComponent = $HurtboxComponent
@onready var walk: AudioStreamPlayer2D = $walk
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
const SPEED = 250.0
const JUMP_VELOCITY = -520

var walk_dust_add = preload("res://walk_dust.tscn")

var move_dir = 0
var jump_used: bool = false

var has_key: bool = true

func _ready() -> void:
	Global.player = self

func update_velocity(delta:float):
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
	
	
func update_input(delta: float):
	if Input.is_action_just_pressed("jump") && !jump_used:
		jump_used = true
		state_chart.send_event("jump")
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("ghost"):
		state_chart.send_event("loop")
		
	move_dir = (Input.get_axis("move_left", "move_right"))
	
	if move_dir == -1:
		velocity.x = move_dir * SPEED
		sprite.flip_h = true
		
	if move_dir == 1:
		velocity.x = move_dir * SPEED
		Global.player.sprite.flip_h = false
		
	if move_dir == 0:
		velocity.x = move_toward(velocity.x,0,SPEED)


func _on_health_component_died() -> void:
	state_chart.send_event("death")

func play_walk():
	AudioManager.play_sound(load("res://player/kenney_impact-sounds/Audio/footstep_carpet_000.ogg"),self.global_position,0)

func create_walk_dust():
	var walk_dust = walk_dust_add.instantiate()
	get_tree().current_scene.add_child(walk_dust)
	walk_dust.global_position = self.global_position
	walk_dust.flip_h = sprite.flip_h

func loop():
	global_position = get_tree().get_first_node_in_group("start").global_position
