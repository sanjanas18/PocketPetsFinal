extends Node2D
var begginingaray = ["wolf"]
var levels_done = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_sanctuary_pressed():
	get_tree().change_scene_to_file("res://Sanctuary.tscn") # Replace with function body.


	


func _on_reset_pressed():
	$ProgressReset.show()
	var dict = {"characters": begginingaray,
		"levelscomplete" : levels_done}
	var save_file = FileAccess.open("user://savegame.json", FileAccess.WRITE)
	save_file.store_string(JSON.stringify(dict))
	
	



func _on_levels_pressed():
	get_tree().change_scene_to_file("res://LevelSelector.tscn")


func _on_close_button_pressed():
	$ProgressReset.hide()
