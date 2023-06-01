extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var winscreen = get_node("Player/WinScreen")
	#print(winscreen)
	


func _on_win_trigger_body_entered(body):
	print(Globals.characteraray)
	if body is Player:
		print("the player reached")
		var winscreen = get_node("Player/WinScreen")
		var wintext = get_node("Player/WinText")
		var winbutton = get_node("Player/WinButton")
		winscreen.show()
		wintext.show()
		winbutton.show()
		Globals.levels_done = 2 
		Globals.save()
		



func _on_win_button_pressed():
	get_tree().change_scene_to_file("res://MainMenu.tscn")


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://MainMenu.tscn")
