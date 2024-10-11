extends CharacterBody2D

var speed = 60  # speed in pixels/sec
var last_direction = "down"
var screen_size = Vector2(320, 180)

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		last_direction="right"
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		last_direction="left"
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		last_direction="down"
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		last_direction="up"
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play(last_direction+"_walk")
	else:
		$AnimatedSprite2D.play(last_direction+"_idle")
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
