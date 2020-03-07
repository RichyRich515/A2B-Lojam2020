extends KinematicBody2D

var motion = Vector2(0, 0)

export(float) var max_speed = 200.0
export(float) var jump_power = 250.0

export(float) var acceleration = 50.0
export(float) var gravity = 10.0

var jumping = false

var keys = []
var isHurt = false

func _ready():
	pass


func _process(delta):
	if $Timer.time_left == 0:
		isHurt = false
	if isHurt:
		$AnimatedSprite.self_modulate = Color(0.8,0,0)
	else:
		$AnimatedSprite.self_modulate = Color(1,1,1)


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
		jumping = true
		$Sounds/Jump.play()
	elif on_floor and jumping:
		jumping = false
		$Sounds/Land.play()
	 
	
	motion = move_and_slide(motion, Vector2(0.0, -1.0))


func get_key(color):
	keys.append(color)
	$"Sounds/Key Pickup".play()


func remove_key(color):
	if color in keys:
		keys.remove(color)
		$"Sounds/Door Open".play()
		return true
	else:
		return false


func getHurt():
	isHurt = true
	$Sounds/Hit.play()
	$Timer.start()