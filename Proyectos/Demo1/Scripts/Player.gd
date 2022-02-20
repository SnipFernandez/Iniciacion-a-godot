extends KinematicBody2D

export var speed = 300
export var gravity = 20
export var jump_force = 700

var velocity = Vector2.ZERO

func _physics_process(delta):
	velocity.x = (Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * speed
	velocity.y += gravity
	if is_on_floor() && Input.is_action_just_pressed("ui_up"):
		velocity.y -= jump_force
	velocity = move_and_slide(velocity, Vector2.UP)
