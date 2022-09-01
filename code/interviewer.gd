extends TextureRect

var emotions = {
		'happy' : preload("res://assets/art/programmer/interviewer/happy.png"),
		'sad' : preload("res://assets/art/programmer/interviewer/sad.png"),
		'confused' : preload("res://assets/art/programmer/interviewer/confused.png"),
		'surprised' : preload("res://assets/art/programmer/interviewer/surprised.png"),
	}

var emotion = emotions.happy

func _ready():
	#texture = emotion
	pass
