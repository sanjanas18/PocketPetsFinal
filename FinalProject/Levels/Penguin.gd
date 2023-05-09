extends CharacterBody2D

var tracking = false
var disabled = false



func ready(delta):
	$AnimatedSprite2D.play("idle")
	$Collider.disabled = false   

func _physics_process(delta):
	if tracking == false:
		$AnimatedSprite2D.play("idle")
	elif tracking == true:
		track()
	if disabled == true:
		disablecollider()
		
	
	


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		var cage = get_node("../Cage")
		print("hit")
		cage.hide()
		tracking = true
		print("in tracking")
		disabled = true
		Globals.characteraray.append("Penguin")
		print(Globals.characteraray)
		
		
		
			
		
	
func track():
	var player = get_node("../Player")
	var motion = Vector2()
	position += (player.position - position)/50
	
	move_and_collide(motion)
	
func disablecollider():
	$Collider.disabled = true
	
