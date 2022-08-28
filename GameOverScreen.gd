extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var lvl = 0

#
## Called when the node enters the scene tree for the first time.
func _ready():
	$Label.text = "lvl: " + String(lvl)

func _unhandled_input(event):
	if event is InputEventMouseButton:
		get_tree().change_scene("res://StartScreen.tscn")
