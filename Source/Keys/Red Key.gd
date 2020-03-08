extends Node2D

var y_start = 0
var counter = 0

func _ready():
	y_start = get_position().y


func _process(delta):
	print(position.y)
	position.y = y_start + sin(counter * 4) * 4.0
	counter += delta


func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.get_key("red")
		print("deleting key")
		queue_free()

