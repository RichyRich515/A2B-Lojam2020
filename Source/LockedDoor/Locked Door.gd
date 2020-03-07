extends Node2D

func _on_Area2D_body_entered(body):
	if body.name == "Player" and body.remove_key("red"):
		queue_free()