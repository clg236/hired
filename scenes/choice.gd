extends Button

onready var choice_text = $choice_text
var root

func _ready():
	connect("pressed", self, "_on_button_pressed")
	rect_size = choice_text.rect_size

func _on_button_pressed():
	root._select_choice(get_index())
