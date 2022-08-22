extends Control

onready var bg = $bg

var scroll_speed = 100
var shader_time : float = 0.0
var characters = ['consulting','design']
var selected_character = 0
onready var back_button = $VBoxContainer/CenterContainer/HBoxContainer/back
onready var forward_button = $VBoxContainer/CenterContainer/HBoxContainer/forward
onready var character = $VBoxContainer/CenterContainer/HBoxContainer/character
onready var start_button = $VBoxContainer/start_button
onready var transition = $transition



func _ready():
	back_button.connect("pressed", self, "_on_back_button_pressed")
	forward_button.connect("pressed", self, "_on_forward_button_pressed")
	start_button.connect("pressed", self, "_on_start_button_pressed")

func _process(delta):
	shader_time += delta
	bg.material.set_shader_param("iTime", shader_time)

func _on_forward_button_pressed():
	print(characters.size())
	if selected_character < characters.size() - 1:
		selected_character += 1
		forward_button.disabled = true
		back_button.disabled = false
	print(characters[selected_character])
func _on_back_button_pressed():
	if selected_character >= characters.size() - 1:
		selected_character -= 1
		back_button.disabled = true
		forward_button.disabled = false
	print(characters[selected_character])

func _on_start_button_pressed():
	Globals.player = selected_character
	var transition_tween = create_tween()
	transition_tween.tween_property(transition.material, "shader_param/position", -1.5, 1.0)
	yield(transition_tween, "finished")
	# get_tree().change_scene("res://scenes/resume_builder.tscn")
	get_tree().change_scene("res://scenes/interview.tscn")
