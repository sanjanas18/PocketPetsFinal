extends Enemy

func hit():
	print("hit enemy")
	self.queue_free()
	# Called when your enemy is hit, you probably want to implement it


func _on_area_2d_body_entered(body):
	print('hit') # Replace with function body.
