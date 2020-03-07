extends KinematicBody2D

var motion = Vector2(0, 0)

export(float) var max_speed = 200.0
export(float) var jump_power = 250.0

export(float) var acceleration = 50.0
export(float) var gravity = 10.0

var jumping = false
var initialPosition
var isLookingLeft = false

var keys = []
onready var anim = get_node("AnimatedSprite")
var isHurt = false
var shakeDir = 1

func _ready():
	initialPosition = position
	pass
	
	
func _process(delta):
	if $Timer.time_left == 0:
		isHurt = false
	if isHurt:
		$AnimatedSprite.self_modulate = Color(0.8,0,0)
		$Camera2D.offset.x += shakeDir * 200 * delta
		if $Camera2D.offset.x > 3.5:
			shakeDir = -1
		if $Camera2D.offset.x < -3.5:
			shakeDir = 1
	else:
		$Camera2D.offset.x = 0
		$AnimatedSprite.self_modulate = Color(1,1,1)		


func _physics_process(delta):
	var on_floor = is_on_floor()
	motion.y += gravity
	
	if Input.is_action_pressed("move_right"):
		motion.x = min(motion.x + acceleration, max_speed)
		if(isLookingLeft):
			isLookingLeft = !isLookingLeft
			scale.x *= -1
		if(on_floor):
			anim.play("MoveRight")
	elif Input.is_action_pressed("move_left"):
		motion.x = max(motion.x - acceleration, -max_speed)
		if(!isLookingLeft):
			isLookingLeft = !isLookingLeft
			scale.x *= -1
		if(on_floor):
			anim.play("MoveRight")
	else:
		motion.x = 0
		anim.play("Idle")
	
	
	if on_floor and Input.is_action_just_pressed("jump"):
		motion.y = -jump_power
	
	motion = move_and_slide(motion, Vector2(0.0, -1.0))


func get_key(color):
	keys.append(color)


func remove_key(color):
	if color in keys:
		keys.remove(color)
		return true
	else:
		return false
		
func getHurt():
	isHurt = true
	$Timer.start()