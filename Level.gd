extends Node2D

export var lvl = 1

var safe_radius = 40.0

var public_scn = preload("res://Public.tscn")
var evil_scn = preload("res://Evil.tscn")
var hidden_scn = preload("res://Hidden.tscn")

var lampadaire_scn = preload("res://Lampadaire.tscn")

var poubelle_scn = preload("res://Poubelle.tscn")

#func _ready():
#	$President.position = Vector2(safe_radius, get_viewport_rect().size.y/2)
#	$Guard.position = Vector2(safe_radius, get_viewport_rect().size.y/2 - safe_radius*2)
#	$Guard.target = $Guard.position

func _ready():
	$LvlLabel.text = "lvl: " + String(lvl)
	for _i in range(int(10+lvl*2)):
		$YSort.add_child(public_scn.instance())
	for _i in range(int((lvl-1)*2)):
		if randi()%2 == 0:
			$YSort.add_child(evil_scn.instance())
		else:
			$YSort.add_child(hidden_scn.instance())
	
	$RoadBG.frame = randi()%3
	
	for _i in range(randi()%5):
		var lampadaire = lampadaire_scn.instance()
		lampadaire.position.x = rand_range(0, get_viewport_rect().size.x)
		lampadaire.position.y = rand_range(0, get_viewport_rect().size.y)
		$YSort.add_child(lampadaire)
	
	for _i in range(randi()%5):
		var poubelle = poubelle_scn.instance()
		poubelle.position.x = rand_range(0, get_viewport_rect().size.x)
		poubelle.position.y = rand_range(0, get_viewport_rect().size.y)
		$YSort.add_child(poubelle)
	
		

func _physics_process(_delta):
	if $YSort/President.position.x + safe_radius > get_viewport_rect().size.x:
		get_parent().next_lvl()
