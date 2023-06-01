class_name Player extends CharacterBody2D

enum State {IDLE, MOVE, ATTACK, DEAD}
var curstate = State.IDLE
var speed = 8
var lastmovedir: Vector2 = Vector2.ZERO
var lastdir: Vector2 = Vector2.ZERO
var state_time = 0.0
var character_to_use = Globals.character_in_use
var playerhealth = 100
var collect = false
var inputon = false
var moveable = true

func _ready():
	$RightAttack.monitoring = false
	$LeftAttack.monitoring = false
	$BottomAttack.monitoring = false
	$TopAttack.monitoring = false
	$Sprite.play(character_to_use + "_idle")
	
	


	
#switching function between moving, idling and attacking
#minitoring helps this one bug where sometimes it doesn't attack
func switch_to(new_state: State):
	curstate = new_state
	state_time = 0.0
	$RightAttack.monitoring = false
	$LeftAttack.monitoring = false
	$BottomAttack.monitoring = false
	$TopAttack.monitoring = false
	if new_state == State.MOVE:
		update_movement_animation()
	elif new_state == State.IDLE:
		$Sprite.play(character_to_use + "_idle")
	elif new_state == State.ATTACK:
		$RightAttack.monitoring = true
		$LeftAttack.monitoring = true
		$BottomAttack.monitoring = true
		$TopAttack.monitoring = true
		$Sprite.frame = 0
		if lastmovedir.x > 0:
			$Sprite.play(character_to_use + "_attack")
			#$Sprite.speed_scale = 0.5
			$Sprite.flip_h = false
		elif lastmovedir.x < 0:
			$Sprite.play(character_to_use + "_attack")
			#$Sprite.speed_scale = 0.5
			$Sprite.flip_h = true
		elif lastmovedir.y >0:
			$Sprite.play(character_to_use + "_frontattack")
		elif lastmovedir.y < 0:
			$Sprite.play(character_to_use + "_back")
	if new_state == State.DEAD:
		moveable = false
		
		$Sprite.hide()
		var deadtext = get_node("../Player/DeadText")
		
		
		#$Dead.set_visible(true)
		#$DeadText.set_visible(true)
		
		$Dead.show()
		$DeadText.show()
		$DeadScreen.show()
		
		
func update_movement_animation():
	if curstate == State.MOVE:
		if lastmovedir.x > 0:
			$Sprite.play(character_to_use + "_right")
			$Sprite.flip_h = false
		elif lastmovedir.x < 0:
			$Sprite.play(character_to_use + "_right")
			$Sprite.flip_h = true
		elif lastmovedir.y > 0:
			$Sprite.play(character_to_use + "_front")
			$Sprite.flip_h = false
		elif lastmovedir.y < 0:
			$Sprite.play(character_to_use + "_back")
			$Sprite.flip_h = false
	
	

func _physics_process(delta):
	#print(curstate)
	var dir = Vector2.ZERO
	
	# Setup a movement vector based on keyboard input
	if Input.is_action_pressed("ui_up") and moveable == true:
		dir.y = -1
		switch_to(State.MOVE)
		inputon = true
	elif Input.is_action_pressed("ui_down") and moveable == true:
		dir.y = 1	
		switch_to(State.MOVE)
		inputon = true
	if Input.is_action_pressed("ui_left") and moveable == true:
		dir.x = -1	
		switch_to(State.MOVE)
		inputon = true
	elif Input.is_action_pressed("ui_right") and moveable == true:
		dir.x = 1	
		switch_to(State.MOVE)	
		inputon = true
	elif Input.is_action_just_pressed("ui_accept") and moveable == true:
		switch_to(State.ATTACK)
	else:
		inputon = false
	

		
	# Apply that movement and save the last vectors as part of our state so we can select which
	# animation to play layer
	move_and_collide(dir * speed)	
	lastdir = dir

	if dir.length() > 0:
		lastmovedir = dir

	update_movement_animation()

	state_time += delta
	if playerhealth <= 0:
		switch_to(State.DEAD)
		#$Camera2D.queue_free()

func onHit():
	playerhealth -= 10
	print(playerhealth)
	$Health.text = "HP " + str(playerhealth)
func collected():
	collect = true
	var character_sprite = Globals.current_sprite
	Globals.characteraray.append(character_sprite)
	print(Globals.characteraray)

func _on_sprite_animation_finished():
	#print("calling function after animation finished")
	if curstate == State.ATTACK:
		#print("reached here")
		if lastdir.length() > 0:
			switch_to(State.MOVE)
		else:
			switch_to(State.IDLE)
	if curstate == State.MOVE and inputon == false:
		switch_to(State.IDLE)
	
			




func _on_right_attack_body_entered(body):
	#print("about to attack")
	if curstate == State.ATTACK and body != self:
		print("in attack mode by enemy")
		if body is Enemy:
			body.hit()





func _on_left_attack_body_entered(body):
	#print("about to attack")
	if curstate == State.ATTACK and body != self:
		print("in attack mode by enemy")
		if body is Enemy:
			body.hit()
			




func _on_dead_pressed():
	get_tree().change_scene_to_file("res://MainMenu.tscn")


func _on_bottom_attack_body_entered(body):
	#print("about to attack")
	if curstate == State.ATTACK and body != self:
		print("in attack mode by enemy")
		if body is Enemy:
			body.hit()




func _on_top_attack_body_entered(body):
	print("about to attack from boto")
	if curstate == State.ATTACK and body != self:
		print("in attack mode by enemy")
		if body is Enemy:
			body.hit()


func _on_win_button_pressed():
	get_tree().change_scene_to_file("res://MainMenu.tscn")
