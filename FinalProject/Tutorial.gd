extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_done_trigger_body_entered(body):
	if body is Player:
		
		var WinScreen = get_node("Player/WinScreen")
		var WinText = get_node("Player/WinText")
		var WinButton = get_node("Player/WinButton")
		WinScreen.show()
		WinText.show()
		WinButton.show()




func _on_win_button_pressed():
	get_tree().change_scene_to_file("res://MainMenu.tscn")
