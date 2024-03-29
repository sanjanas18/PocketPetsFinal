extends Enemy
enum State {IDLE, ATTACK, DEAD} #add attack SOON!
var curstate = State.IDLE
var state_time = 0.0

func hit():

	var banana = "banana"
	print("hit enemy")
	switch_to(State.DEAD)
	


func _ready():
	pass
	switch_to(State.IDLE)
	

func switch_to(new_state: State):
	curstate = new_state
	state_time = 0.0
	
	if new_state == State.IDLE:
		
		$AnimatedSprite2D.play("enemy_one_idle")
	
	elif new_state == State.ATTACK:
		$AnimatedSprite2D.play("enemy_one_attack")
	
	elif new_state == State.DEAD:
		$AnimatedSprite2D.play("enemy_one_dead")
		

func _physics_process(delta):
	var player = get_tree().get_root().find_child("Player", true, false)
	var dir = player.position - self.position
	#gets the angle
	var angle = rad_to_deg(dir.angle())
	var distance = self.position.distance_to(player.position)
	
	
	if curstate == State.IDLE and distance <= 200:
		switch_to(State.ATTACK)
	if curstate == State.ATTACK and distance > 200:
		switch_to(State.IDLE)




func _on_attack_2d_body_entered(body):
	if curstate == State.ATTACK and body != self:
		print("in attack mode by enemy")
		if body is Player:
			body.onHit()
		

	


func _on_animated_sprite_2d_animation_finished():
	if curstate == State.ATTACK:
		switch_to(State.IDLE)

	if curstate == State.DEAD:
		self.queue_free()

