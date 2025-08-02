class_name JuicyCamera 
extends Camera2D
## A juiced out camera. Apply screen shake by calling [method apply_shake], plugging in the desired intensity and fade values.

var rng = RandomNumberGenerator.new()
## The maximum amount of pixels the camera can be randomly offset by, during screen shake.
var shake_strength: float = 0.0
## How much the strength is multiplied by every second. Must be a value between 0.0 and 1.0.
var shake_fade: float = 0.1

func _ready():
	Global.camera = self
	update_zoom()

func _process(delta: float) -> void:
	if shake_strength > 0:
		# Used fancy math taken from this forum 
		# https://forum.godotengine.org/t/does-lerp-use-delta/9427/3
		shake_strength = lerp(shake_strength, 0.0, 1.0 - pow(shake_fade, delta))
		
		offset = random_offset()

## Apply screen shake based on [param intensity] and [param fade]. [br]
## See [member shake_strength] and [member shake_fade] for a description of what they do.
func apply_shake(intensity: float = 1.0, fade: float = 0.1):
	shake_strength = intensity
	shake_fade = fade

## Randomly offsets the camera every frame based on [member shake_strength]
func random_offset():
	return Vector2(rng.randf_range(-shake_strength,shake_strength),rng.randf_range(-shake_strength,shake_strength))

## Sets [member Camera2D.zoom] to [member Global.camera_zoom]
func update_zoom():
	zoom = Global.camera_zoom
