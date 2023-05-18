extends Enemy

enum State {IDLE, ATTACK, DEAD, TRACK} #add attack SOON!
var curstate = State.IDLE
var state_time = 0.0
var tracking = false

func hit():

	var banana = "banana"
	print("hit enemy")
	switch_to(State.DEAD)
	
	# Called when your enemy is hit, you probably want to implement it

func _ready():
	pass
	switch_to(State.IDLE)
	

func switch_to(new_state: State):
	curstate = new_state
	state_time = 0.0
	
	if new_state == State.IDLE:
		
		$Sprite.play("enemy_two_idle")
	
	elif new_state == State.ATTACK:
		$Sprite.play("enemy_two_attack")
	
	elif new_state == State.DEAD:
		$Sprite.play("enemy_two_dead")
	
		
		

func _physics_process(delta):
	pass
	var player = get_tree().get_root().find_child("Player", true, false)
	
	var dir = player.position - self.position
	#gets the angle
	var angle = rad_to_deg(dir.angle())
	var distance = self.position.distance_to(player.position)
	
	
	if curstate == State.IDLE and distance <= 200:
		switch_to(State.ATTACK)
	if curstate == State.ATTACK and distance > 200:
		switch_to(State.IDLE)
	if curstate == State.ATTACK and distance <= 100:
		tracking = true
	if tracking == true:
		if Input.is_action_pressed("ui_left"):
			$Sprite.play("enemy_two_attack")
			$Sprite.flip_h = true
		elif Input.is_action_pressed("ui_right"):
			$Sprite.play("enemy_two_attack")
			$Sprite.flip_h = false
		if state_time < 6:
			var motion = Vector2()
			position += (player.position - position)/50
			
			move_and_collide(motion)
			await get_tree().create_timer(4.0).timeout
			tracking = false
			
			
		


func _on_attack_2d_body_entered(body):
	if curstate == State.ATTACK and body != self:
		print("in attack mode by enemy")
		if body is Player:
			body.onHit()
			#IMPLEMENT HIT FOR PLAYER
			






func _on_sprite_animation_finished():
	if curstate == State.ATTACK:
		switch_to(State.IDLE)
	#do the same for the other states
	if curstate == State.DEAD:
		self.queue_free()
	
		
		
