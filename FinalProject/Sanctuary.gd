extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var load_file = FileAccess.open("user://savegame.json", FileAccess.READ)

	var dict = JSON.parse_string(load_file.get_as_text())
	
	var characters = dict["characters"]
	$Wolf.play("idle")
	$Penguin.play("idle")
	$Bear.play("idle")
	print("characters right now: " + str(characters))
	#print(dict["levelscomplete"])
	for sprite in characters:
		if sprite == "wolf":
			$Wolf.show()
			print("contains")
		if sprite == "Penguin":
			$Penguin.show()
		if sprite == "Bear":
			$Bear.show()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#var load_file = FileAccess.open("user://savegame.json", FileAccess.READ)
	pass
	#var dict = JSON.parse_string(load_file.get_as_text())
	#print(dict["characters"])



func _on_wolf_equip_pressed():
	Globals.character_in_use = "wolf" # Replace with function body.
	$EquipText.text = "The Wolf is Equipped"
	$EquipClose.show()
	$EquipText.show()
	$EquipScreen.show()
	$Close.show()
	


func _on_levels_pressed():
	
	get_tree().change_scene_to_file("res://LevelSelector.tscn")
	


func _on_equip_close_pressed():
	$EquipClose.hide()
	$EquipText.hide()
	$EquipScreen.hide()
	$Close.hide()



func _on_bear_equip_pressed():
	var load_file = FileAccess.open("user://savegame.json", FileAccess.READ)

	var dict = JSON.parse_string(load_file.get_as_text())
	
	Globals.character_in_use = "bear" # Replace with function body.
	$EquipText.text = "The Bear is Equipped"
	$EquipClose.show()
	$EquipText.show()
	$EquipScreen.show()
	print(dict["characters"])


func _on_main_menu_button_pressed():
	get_tree().change_scene_to_file("res://MainMenu.tscn")
