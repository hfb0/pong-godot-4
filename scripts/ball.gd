extends CharacterBody2D

const INITIAL_BALL_SPEED = 150
var initial_position
var ball_speed = Vector2.ZERO
var speed = 1

func _ready():
	initial_position = position
	ball_speed.x = [-1, 1][randi() % 2] * INITIAL_BALL_SPEED
	ball_speed.y = [-0.8, 0.8][randi() % 2] * INITIAL_BALL_SPEED

func _physics_process(delta):
	var collision = move_and_collide(ball_speed * delta)
	
	if collision:
		if collision.get_collider().get('name') in ['bottom_wall', 'top_wall']:
			ball_speed.y *= -1 * speed
		if collision.get_collider().get('name') in ['player', 'computer']:
			speed *= 1.05
			if collision.get_normal().x != 0:
				ball_speed.x *= -1 * speed
			elif collision.get_normal().y != 0:
				ball_speed.y *= -1 * speed
		if collision.get_collider().get('name') in ['left_goal', 'right_goal']:
			position = initial_position
			ball_speed.x = [-1, 1][randi() % 2] * INITIAL_BALL_SPEED
			ball_speed.y = [-0.8, 0.8][randi() % 2] * INITIAL_BALL_SPEED
			speed = 1
