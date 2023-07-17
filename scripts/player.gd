extends CharacterBody2D

# Constant for pads speed
const PAD_SPEED = 150

func _physics_process(delta):
	if Input.is_action_pressed('move_up'):
		move_and_collide(Vector2(0, -PAD_SPEED) * delta)
	if Input.is_action_pressed('move_down'):
		move_and_collide(Vector2(0, PAD_SPEED) * delta)
