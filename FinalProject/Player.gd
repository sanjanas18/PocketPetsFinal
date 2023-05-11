extends CharacterBody2D

enum State {IDLE, MOVE, ATTACK} #add attack SOON!
var curstate = State.IDLE
var speed = 5
var lastmovedir: Vector2 = Vector2.ZERO
var lastdir: Vector2 = Vector2.ZERO
var state_time = 0.0
var character_to_use = Globals.character_in_use

func _ready():
	$Sprite.play(character_to_use + "_idle")
	
	


	

func switch_to(new_state: State):
	curstate = new_state
	state_time = 0.0
	
	if new_state == State.MOVE:
		update_movement_animation()
		
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
	elif curstate == State.IDLE:
		$Sprite.play(character_to_use + "_idle")

func _physics_process(delta):
	var dir = Vector2.ZERO
	
	# Setup a movement vector based on keyboard input
	if Input.is_action_pressed("ui_up"):
		dir.y = -1
		switch_to(State.MOVE)
	elif Input.is_action_pressed("ui_down"):
		dir.y = 1	
		switch_to(State.MOVE)
	elif Input.is_action_pressed("ui_left"):
		dir.x = -1	
		switch_to(State.MOVE)
	elif Input.is_action_pressed("ui_right"):
		dir.x = 1	
		switch_to(State.MOVE)	
	else:
		switch_to(State.IDLE)
		
	# Apply that movement and save the last vectors as part of our state so we can select which
	# animation to play layer
	move_and_collide(dir * speed)	
	lastdir = dir

	if dir.length() > 0:
		lastmovedir = dir

	update_movement_animation()

	state_time += delta
