extends Node2D

# Declare member variables here. Examples:
export var move_speed = 400
export var focus: bool setget set_focus

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2(0,0)
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * move_speed
		position += velocity * delta
		if velocity.x > 0:
			$AnimatedSprite.flip_h = false
		elif velocity.x < 0:
			$AnimatedSprite.flip_h = true
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
func set_focus(b: bool):
	focus = b
	$AnimatedSprite/Camera2D.current = b