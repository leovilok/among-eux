extends Node2D

export var lvl = 1

var safe_radius = 40.0

var public_scn = preload("res://Public.tscn")
var evil_scn = preload("res://Evil.tscn")

#func _ready():
#	$President.position = Vector2(safe_radius, get_viewport_rect().size.y/2)
#	$Guard.position = Vector2(safe_radius, get_viewport_rect().size.y/2 - safe_radius*2)
#	$Guard.target = $Guard.position

func _ready():
	$LvlLabel.text = "lvl: " + String(lvl)
	for i in range(int(10+lvl*2)):
		$YSort.add_child(public_scn.instance())
	for i in range(int((lvl-1)*2)):
		$YSort.add_child(evil_scn.instance())
	
		

func _physics_process(_delta):
	if $YSort/President.position.x + safe_radius > get_viewport_rect().size.x:
		get_parent().next_lvl()
