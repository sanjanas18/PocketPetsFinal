extends CharacterBody2D

func _ready():
	$AnimatedSprite2D.play("idle")
	var nodetwo = get_node("../Player/boxtext")
	nodetwo.text = "Beware of Enemies Beyond, save the creature if you may. Escape you must, find the gem to continue your day."



func _on_area_2d_body_entered(body):
	if body is Player:
		print("in")
	
	
		print("true")
		var nodeone = get_node("../Player/box")
		var nodetwo = get_node("../Player/boxtext")
		var animation = get_node("../Player/AnimationPlayer")
		print(nodeone)
		nodeone.show()
		nodetwo.show()
		animation.play("typing")
		await get_tree().create_timer(3.0).timeout
		nodetwo.hide()
		nodeone.hide()
		
		
		
