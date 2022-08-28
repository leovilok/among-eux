extends "res://Public.gd"

class_name Evil

var pnj_evil_frames = [preload("res://PNJ1evilframes.tres"), preload("res://PNJ2evilframes.tres"), preload("res://PNJ3evilframes.tres")]

func _ready():
	max_speed = max_speed*3.5
	force = force*5
	pnj_frames = pnj_evil_frames
	init()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
