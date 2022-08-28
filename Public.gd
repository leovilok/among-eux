extends RigidBody2D

export var max_speed = 20.0
export var force = 20.0

var pnj_frames = [preload("res://PNJ1frames.tres"), preload("res://PNJ2frames.tres"), preload("res://PNJ3frames.tres")]

var type = -1

func init():
	max_speed = rand_range(0, max_speed)
	
	if position == Vector2():
		var vp_size = get_viewport_rect().size
		position.x = rand_range(vp_size.x/10, vp_size.x-30.0)
		position.y = rand_range(30.0, vp_size.y-30.0)
	
	if type == -1:
		type = randi()%3
	
	$Sprite.frames = pnj_frames[type]

func _ready():
	init()

func _process(_delta):
	$Sprite.rotation = -rotation
	
	var direction = int(rad2deg(linear_velocity.angle())+360+45)%360/90
	if direction == 0:
		$Sprite.animation = "right"
	elif direction == 1:
		$Sprite.animation = "down"
	elif direction == 2:
		$Sprite.animation = "left"
	elif direction == 3:
		$Sprite.animation = "up"

func _integrate_forces(state):
	#print_debug(state.linear_velocity.x)
	var direction = get_node("../President").position - position
	if state.linear_velocity.length() < max_speed:
		applied_force = direction.normalized() * force
	else:
		applied_force = Vector2()
