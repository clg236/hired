extends Node2D

onready var select_button = $ui/Control/select_button
onready var left_button = $ui/Control/HBoxContainer/left_button
onready var right_button = $ui/Control/HBoxContainer/right_button

var character = 'bob'

func _ready():
	select_button.connect("pressed", self, "_on_select_button_pressed", [character])
	left_button.connect('pressed', self, '_on_left_button_pressed')
	right_button.connect('pressed', self, '_on_right_button_pressed')

func _on_select_button_pressed(character):
	Globals.player = character
	get_tree().change_scene("res://scenes/resume_builder.tscn")

func _on_right_button_pressed():
	pass
	
func _on_left_button_pressed():
	pass
	
