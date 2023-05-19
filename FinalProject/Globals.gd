extends Node

var character_in_use = "wolf"
var characteraray = ["wolf"]
var current_sprite = "Bear"
var levels_done = 0


func save():
	var dict = {"characters": characteraray,
		"levelscomplete" : levels_done}
	var save_file = FileAccess.open("user://savegame.json", FileAccess.WRITE)
	save_file.store_string(JSON.stringify(dict))
	print(dict)
	print("Saved")
