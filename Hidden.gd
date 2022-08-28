extends "res://Public.gd"

export var detect_dist = 100.0

var target

var evil_scn = preload("res://Evil.tscn")

func _ready():
	init()
	target = get_node("../President")

func _process(delta):
	if position.distance_to(target.position) < detect_dist:
		var evil = evil_scn.instance()
		evil.type = type
		evil.position = position
		get_parent().add_child(evil)
		queue_free()
