extends RigidBody2D

export var max_speed = 20.0
export var force = 20.0

func _ready():
	max_speed = rand_range(0, max_speed)

func _integrate_forces(state):
	#print_debug(state.linear_velocity.x)
	var direction = get_node("../President").position - position
	if state.linear_velocity.length() < max_speed:
		applied_force = direction.normalized() * force
	else:
		applied_force = Vector2()
