extends RigidBody2D

export var max_speed = 30.0

var gameover_scn = preload("res://GameOverScreen.tscn")

func _ready():
	contact_monitor = true
	contacts_reported = 10

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

func _on_President_body_entered(body):
	if body is Evil:
		var lvl = get_parent().get_parent().lvl
		#get_tree().change_scene("res://GameOverScreen.tscn")
		#get_viewport().get_child(0).lvl = lvl
		var gameover = gameover_scn.instance()
		gameover.lvl = get_parent().get_parent().lvl
		get_parent().get_parent().add_child(gameover)
		max_speed = 0
