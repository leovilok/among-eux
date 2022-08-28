extends RigidBody2D

export var max_speed = 30.0

func _integrate_forces(state):
	#print_debug(state.linear_velocity.x)
	if state.linear_velocity.x < max_speed:
		applied_force.x = 30.0
	else:
		applied_force.x = 0
