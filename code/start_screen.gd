extends Control

onready var start_button = $Panel/CenterContainer/VBoxContainer/start_button

func _ready():
	start_button.connect("pressed", self, "_on_start_pressed")
	
func _on_start_pressed():
	var transition_tween = create_tween()
	transition_tween.tween_property($transition.material, "shader_param/position", -1.5, 1.0)
	yield(transition_tween, "finished")
	get_tree().change_scene("res://scenes/test/character_select.tscn")
