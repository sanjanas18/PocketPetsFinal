class_name NewCharacter extends CharacterBody2D

var tracking = false
var disabled = false
var first = true
var direction



func ready(delta):
	
	var currentt = self.get_name()
	
	$AnimatedSprite2D.play(currentt + "_idle")
	$Collider.disabled = false   

func _physics_process(delta):
	Globals.current_sprite = self.get_name()
	var current = self.get_name()
	#print(Globals.current_sprite)
	
	
	if tracking == false:
		$AnimatedSprite2D.play(current + "_idle")
	elif tracking == true:
		track()
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
		$AnimatedSprite2D.play(current + "_idle")
	
func Penguincollected():
	pass


func _on_area_2d_body_entered(body):
	if body is Player:
		var cage = get_node("../Cage")
		print("hit")
		cage.hide()
		tracking = true
		print("in tracking")
		disabled = true
		if first == true:
			body.collected()
			first = false
		
		
		
		
		
			
		
	
func track():
	var current = self.get_name()
	var player = get_node("../Player")
	var motion = Vector2()
	position += (player.position - position)/100
	#print(position)
	
	move_and_collide(motion)
	
	
	if direction == 1:
	
		$AnimatedSprite2D.play(current + "_up")
	elif direction == 2:
		
		$AnimatedSprite2D.play(current + "_right")
		$AnimatedSprite2D.flip_h = false
	elif direction == 3:
		
		$AnimatedSprite2D.play(current + "_down")
	elif direction == 4:
		
		$AnimatedSprite2D.play(current + "_right")
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.play(current + "_idle")
	
func disablecollider():
	$Collider.disabled = true
	
