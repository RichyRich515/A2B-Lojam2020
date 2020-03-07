extends KinematicBody2D

var motion = Vector2(0, 0)

export(float) var max_speed = 200.0
export(float) var jump_power = 250.0

export(float) var acceleration = 50.0
export(float) var gravity = 10.0

var jumping = false



func _ready():
	
	pass

func _physics_process(delta):
	motion.y += gravity
	
	if Input.is_action_pressed("move_right"):
		motion.x = min(motion.x + acceleration, max_speed)
	elif Input.is_action_pressed("move_left"):
		motion.x = max(motion.x - acceleration, -max_speed)
	else:
		motion.x = 0
	
	var on_floor = is_on_floor()
	
	if on_floor and Input.is_action_just_pressed("jump"):
		motion.y = -jump_power
	
	motion = move_and_slide(motion, Vector2(0.0, -1.0))