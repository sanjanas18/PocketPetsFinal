extends CharacterBody2D

enum State {IDLE, MOVE} #add attack SOON!
var curstate = State.IDLE
var speed = 5
var lastmovedir: Vector2 = Vector2.ZERO
var lastdir: Vector2 = Vector2.ZERO
var state_time = 0.0
var character_to_use = Globals.character_in_use

func _ready():
	$Sprite.play("wolf_idle")



func _physics_process(delta):
	var dir = Vector2.ZERO
	

