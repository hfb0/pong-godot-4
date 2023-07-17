extends CharacterBody2D

var ball
var speed = 150

func _ready():
	ball = get_parent().find_child('ball')

func _physics_process(delta):
	var collision = move_and_collide(Vector2(0, get_opponent_direction() * speed) * delta)
	
	if collision:
		if collision.get_collider().get('name') == 'ball':
			speed *= 1.3

func get_opponent_direction():
	if ball.position.y > position.y: return 1
	elif ball.position.y < position.y : return -1
	else: return 0
