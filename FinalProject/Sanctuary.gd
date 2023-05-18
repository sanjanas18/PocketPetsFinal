extends Node2D
var characters = Globals.characteraray

# Called when the node enters the scene tree for the first time.
func _ready():
	$Wolf.play("idle")
	$Penguin.play("idle")
	$Bear.play("idle")
	print(characters)
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
	pass


func _on_wolf_equip_pressed():
	Globals.character_in_use = "wolf" # Replace with function body.
	$EquipText.text = "The Wolf is Equipped"
	$EquipClose.show()
	$EquipText.show()
	$EquipScreen.show()

func _on_levels_pressed():
	
	get_tree().change_scene_to_file("res://Levels/LevelOne.tscn")
	


func _on_equip_close_pressed():
	$EquipClose.hide()
	$EquipText.hide()
	$EquipScreen.hide()

