extends RigidBody2D

export var max_speed = 30.0

func _process(_delta):
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
	if state.linear_velocity.x < max_speed:
		applied_force.x = 30.0
	else:
		applied_force.x = 0
