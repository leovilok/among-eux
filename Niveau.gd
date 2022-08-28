extends Node2D

var lvl = 0

var safe_radius = 50.0

func _ready():
	$President.position = Vector2(safe_radius, get_viewport_rect().size.y/2)
	$Guard.position = Vector2(safe_radius, get_viewport_rect().size.y/2 - safe_radius*2)
	$Guard.target = $Guard.position

func _physics_process(_delta):
	if $President.position.x + safe_radius > get_viewport_rect().size.x:
		_ready()
