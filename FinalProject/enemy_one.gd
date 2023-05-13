extends Enemy
enum State {IDLE, TRACKING, ATTACK} #add attack SOON!
var curstate = State.IDLE
var state_time = 0.0

func hit():

	var banana = "banana"
	print("hit enemy")
	self.queue_free()
	# Called when your enemy is hit, you probably want to implement it

func _ready():
	pass
	switch_to(State.ATTACK)
	

func switch_to(new_state: State):
	curstate = new_state
	state_time = 0.0
	
	if new_state == State.IDLE:
		
		$AnimatedSprite2D.play("enemy_one_idle")
	elif new_state == State.TRACKING:
		#tracking
		pass
	elif new_state == State.ATTACK:
		$AnimatedSprite2D.play("enemy_one_attack")
		
		






func _on_attack_2d_body_entered(body):
	if curstate == State.ATTACK and body != self:
		print("in attack mode by enemy")
		if body is Player:
			body.onHit()
			#IMPLEMENT HIT FOR PLAYER

	


func _on_animated_sprite_2d_animation_finished():
	if curstate == State.ATTACK:
		switch_to(State.IDLE)
	#do the same for the other states

