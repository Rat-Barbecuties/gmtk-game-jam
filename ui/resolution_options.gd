extends OptionButton

func _ready() -> void:
	add_resolution()
	
func add_resolution():
	for r in Global.resolutions:
		add_item(r)
