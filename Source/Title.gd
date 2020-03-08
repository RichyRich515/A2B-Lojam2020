extends Node2D

func _input(event):
	if event is InputEventKey:
		if event.pressed:
			get_node("/root/GlobalSounds/Level_Complete").play()
			FadeInOut.fade_to("res://Levels/Level 1/Level 1.tscn")
			self.set_process_input(false)