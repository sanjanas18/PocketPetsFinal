extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var load_file = FileAccess.open("user://savegame.json", FileAccess.READ)
	var dict = JSON.parse_string(load_file.get_as_text())
	var levels = dict["levelscomplete"]
	var index = 1
	while index <= levels:
		print(index)
		#add show the level
		index+=1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
