extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var load_file = FileAccess.open("user://savegame.json", FileAccess.READ)
	var dict = JSON.parse_string(load_file.get_as_text())
	var levels = dict["levelscomplete"]
	var index = 1
	while index <= levels:
		print(index)
		#show the level
		var node = get_node("level_"+str(index))
		node.show()
		#print(levels)
		if index == levels:
			print(index+1)
			var nextindex = index + 1
			
			var next = get_node("level_" + str(nextindex))
			next.show()
		#add show the level
		index+=1
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
