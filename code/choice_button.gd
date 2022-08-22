extends Button

onready var label = $Label

func _ready():
	label.rect_size = rect_size
