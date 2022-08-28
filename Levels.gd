extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var lvl = 1
var level_scn = preload("res://Level.tscn")
var level

func _ready():
	level = level_scn.instance()
	add_child(level)


func next_lvl():
	lvl += 1
	level.queue_free()
	level = level_scn.instance()
	level.lvl = lvl
	add_child(level)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
