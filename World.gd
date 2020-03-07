extends Node2D

func _ready():
	
	pass

func _process(delta):
	if Input.is_action_just_pressed("switch_key"):
		$World1.visible = !$World1.visible
		$World2.visible = !$World2.visible
	
	pass
