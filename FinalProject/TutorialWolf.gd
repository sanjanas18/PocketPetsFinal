extends CharacterBody2D
var tracking = false
var disabled = false
var first = true
var direction



func ready(delta):
	
	
	
	$AnimatedSprite2D.play("wolf_idle")
	$Collider.disabled = false   

func _physics_process(delta):
	
	
	
	if tracking == false:
		$AnimatedSprite2D.play("wolf_idle")
	elif tracking == true:
		var player = get_node("../Player")
		track()
		#global_transform = global_transform.interpolate_with(player.global_transform, delta)
	if disabled == true:
		disablecollider()
	if Input.is_action_pressed("ui_up"):
		direction = 1
	elif Input.is_action_pressed("ui_down"):
		direction = 3
	elif Input.is_action_pressed("ui_left"):
		direction = 4
	elif Input.is_action_pressed("ui_right"):
		direction = 2
	else:
		$AnimatedSprite2D.play("wolf_idle")
	

	
func track():
	
	var player = get_node("../Player")
	var motion = Vector2()
	position += (player.position - position)/1000
	#print(position)
	
	move_and_collide(motion*5)
	
	
	if direction == 1:
		print("up")
		$AnimatedSprite2D.play("wolf_up")
	elif direction == 2:
		print("right")
		$AnimatedSprite2D.play("wolf_right")
		$AnimatedSprite2D.flip_h = false
	elif direction == 3:
		print("down")
		$AnimatedSprite2D.play("wolf_down")
	elif direction == 4:
		print("left")
		$AnimatedSprite2D.play("wolf_right")
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.play("wolf_idle")
	
func disablecollider():
	$Collider.disabled = true


func _on_area_2d_body_entered(body):
	if body is Player:
		var cage = get_node("../Cage")
		print("hit")
		cage.hide()
		tracking = true
		print("in tracking")
		disabled = true
