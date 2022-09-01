extends TextureButton

func _ready():
	connect("pressed", self, "_on_button_pressed")
	connect("button_down", self, "_on_button_down")
	connect("button_up", self, "_on_button_up")
	
func _on_button_down():
	rect_position.y -= rect_size.y/2

func _on_button_up():
	rect_position.y += rect_size.y/2
	
func _on_button_pressed():
	print('pressed')
