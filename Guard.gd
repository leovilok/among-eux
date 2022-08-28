extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var stop_dist = 10.0
export var speed = 70.0
export var dash_speed = 200.0
export var dash_timeout = 3.0
export var dash_duration = .3

var target = Vector2()
var dash_state = -dash_timeout


# Called when the node enters the scene tree for the first time.
func _ready():
	target = position

func _unhandled_input(event):
	if event is InputEventMouseButton:
		target = event.position
		if event.doubleclick and dash_state <= -dash_timeout:
			dash_state = dash_duration
			print("dash")

func _physics_process(delta):
	var to_target = target - position
	if to_target.length() > stop_dist:
		var move_speed = dash_speed if dash_state > 0 else speed
		move_and_slide(to_target.normalized()*move_speed)
	if dash_state > -dash_timeout:
		dash_state -= delta
