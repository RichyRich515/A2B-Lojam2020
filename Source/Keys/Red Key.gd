extends Node2D

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		body.get_key("red")
		print("deleting key")
		queue_free()

