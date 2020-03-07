extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Spike_body_entered(body):
	if body.name == "Player":
#		print("collided with spikes: " + body.name)
		body.motion = body.move_and_slide(
			Vector2(-body.motion.x * 2, 0),
			Vector2(0.0, -1.0))
		body.getHurt()
