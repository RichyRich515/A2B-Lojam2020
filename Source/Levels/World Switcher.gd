extends Node2D

var normal_world = true

func _ready():
	
	pass

func _process(delta):
	if Input.is_action_just_pressed("switch_key"):
		normal_world = !normal_world
		$World1.set_process(normal_world)
		$World1.set_physics_process(normal_world)
		$World1.visible = normal_world
		$World2.set_process(!normal_world)
		$World2.set_physics_process(!normal_world)
		$World2.visible = !normal_world
		if normal_world:
			$Player.collision_layer = 1
			$Player.collision_mask = 1
		else:
			$Player.collision_layer = 2
			$Player.collision_mask = 2
	pass
