extends CharacterBody2D

var tracking = false



func ready(delta):
	$AnimatedSprite2D.play("idle")
	pass   

func _physics_process(delta):
	if tracking == false:
		$AnimatedSprite2D.play("idle")
	if tracking == true:
		track()


func _on_area_2d_body_entered(body):
	
	print("hit")
	if Input.is_action_pressed("XKEY"):
		tracking = true
		print("in tracking")
		
	
func track():
	var player = get_node("../Player")
	var motion = Vector2()
	position += (player.position - position)/50
	
	move_and_collide(motion)
	
