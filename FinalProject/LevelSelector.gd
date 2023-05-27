extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var load_file = FileAccess.open("user://savegame.json", FileAccess.READ)
	var dict = JSON.parse_string(load_file.get_as_text())
	var levels = dict["levelscomplete"]
	var index = 1
	if levels == 0:
		var lvloen = get_node("level_1")
		lvloen.show()
		var firstpaw = get_node("Pawprints_1")
		firstpaw.show()
	while index <= levels:
		print(index)
		var currentpaw = get_node("Pawprints_" + str(index))
		currentpaw.show()
		#show the level
		var node = get_node("level_"+str(index))
		node.show()
		#print(levels)
		if index == levels:
			#print(index+1)
			var nextindex = index + 1
			
			var next = get_node("level_" + str(nextindex))
			next.show()
			
			var nextpaw = get_node("Pawprints_" + str(nextindex))
			nextpaw.show()
		#add show the level
		index+=1
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_level_one_button_pressed():
	get_tree().change_scene_to_file("res://Levels/LevelOne.tscn")
	
	
	
	


func _on_tutorial_button_pressed():
	get_tree().change_scene_to_file("res://Tutorial.tscn")



func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://MainMenu.tscn")
