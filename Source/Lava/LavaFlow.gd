extends TileMap

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var active_lava_tiles = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for x in range(-100,100):
		for y in range(-100,100):
			var cellIdx = get_cell(x,y)
			if cellIdx == 0: active_lava_tiles.append([x,y])
	print(active_lava_tiles)
	pass # Replace with function body.

func _process(delta):
	var frame = (OS.get_ticks_msec() / 4) % 2
	for alt in active_lava_tiles:
		if(frame):			
			set_cell(alt[0],alt[1],1)
		else:
			set_cell(alt[0],alt[1],0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
