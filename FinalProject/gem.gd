extends Area2D
var gems = 0
func _ready():
	$AnimatedSprite2D.play("spin")
	
	# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass
	#var node = get_node("../player/Label")
	


func _on_body_entered(body):
	var wall = get_node("../Wall")
	var inventory = get_node("../Player/Inventory")
	inventory.text = "Inventory: Gem"
	wall.queue_free()
	self.queue_free()
	
