extends Area2D

@onready var speech: Sprite2D = $floatParent/speech
@onready var panel: PanelContainer = $floatParent/PanelContainer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var float_player: AnimationPlayer = $float
@onready var float_parent: Node2D = $floatParent
@onready var tutorial: RichTextLabel = $floatParent/PanelContainer/RichTextLabel

@export_multiline var text: String


func _ready() -> void:
	tutorial.text = text
	
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		animation_player.play("prompt")
		float_player.play("float")
		AudioManager.play_sound(load("res://player/sfx/popup.wav"), self.global_position,0)
		float_parent.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		AudioManager.play_sound(load("res://player/sfx/popup.wav"), self.global_position,0)
		float_parent.visible = false
