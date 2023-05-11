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
	#$AnimatedSprite2D.play("enemy_one_idle")
	

func switch_to(new_state: State):
	curstate = new_state
	state_time = 0.0
	
	if new_state == State.IDLE:
		pass
		#$AnimatedSprite2D.play("enemy_one_idle")
	elif new_state == State.TRACKING:
		#tracking
		pass
	elif new_state == State.ATTACK:
		#attack state
		#if lastmovedir.x > 0:
			#$AnimatedSprite2D.play("enemy_one_attack")
			
			#$Sprite.flip_h = false
		#elif lastmovedir.x < 0:
			#$Sprite.play("enemy_one_attack")
			#$Sprite.speed_scale = 0.5
			#Sprite.flip_h = true
		pass





func _on_attack_2d_body_entered(body):
	#if curstate == State.ATTACK and body != self:
		#print("in attack mode by enemy")
		#if body is Player:
			#body.hit()
			#IMPLEMENT HIT FOR PLAYER

	pass # Replace with function body.


func _on_animated_sprite_2d_animation_finished():
	#if curstate == State.ATTACK:
		#switch_to(State.IDLE)
	#do the same for the other states
	pass # Replace with function body.
