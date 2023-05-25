extends CharacterBody2D

func _ready():
	$AnimatedSprite2D.play("idle")
	



func _on_area_2d_body_entered(body):
	if body is Player:
		var nodetwo = get_node("../Player/boxtext")
		nodetwo.text = "Every level has an animal you can save. Simply go up to the cage. They will appear in the sanctuary after."
		
		print("in")
	
	
		print("true")
		var nodeone = get_node("../Player/box")
		
		var animation = get_node("../Player/AnimationPlayer")
		print(nodeone)
		nodeone.show()
		nodetwo.show()
		animation.play("typing")
		await get_tree().create_timer(7.0).timeout
		nodetwo.hide()
		nodeone.hide()
