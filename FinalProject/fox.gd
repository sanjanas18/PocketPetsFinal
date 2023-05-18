extends CharacterBody2D

func _ready():
	$AnimatedSprite2D.play("idle")



func _on_area_2d_body_entered(body):
	if body is Player:
		print("in")
	
	
		print("true")
		var nodeone = get_node("../Player/box")
		var nodetwo = get_node("../Player/boxtext")
		print(nodeone)
		nodeone.show()
		nodetwo.show()
		
