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
			$Dash.visible = true

func _physics_process(delta):
	var to_target = target - position
	if to_target.length() > stop_dist:
		var move_speed = dash_speed if dash_state > 0 else speed
		move_and_slide(to_target.normalized()*move_speed)
		
		var direction = int(rad2deg(to_target.angle())+360+45)%360/90
		if direction == 0:
			$Sprite.animation = "right"
		elif direction == 1:
			$Sprite.animation = "down"
		elif direction == 2:
			$Sprite.animation = "left"
		elif direction == 3:
			$Sprite.animation = "up"
		
		if dash_state >= 0:
			$Sprite.animation = "dash_" + $Sprite.animation
		
		$Sprite.playing = true
	else:
		$Sprite.playing = false
		$Sprite.frame = 0
	
	if dash_state > -dash_timeout:
		dash_state -= delta
		if dash_state <= 0:
			$Dash.scale.x = (dash_timeout+dash_state)/dash_timeout * 0.01

	else:
		$Dash.visible = false
		
