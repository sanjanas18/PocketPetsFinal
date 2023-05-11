extends Enemy
enum State {IDLE, TRACKING, ATTACK} #add attack SOON!
var curstate = State.IDLE


func hit():

	var banana = "banana"
	print("hit enemy")
	self.queue_free()
	# Called when your enemy is hit, you probably want to implement it

func _ready():
	$AnimatedSprite2D.play("enemy_one_idle")
	
	





func _on_attack_2d_body_entered(body):
	pass # Replace with function body.
