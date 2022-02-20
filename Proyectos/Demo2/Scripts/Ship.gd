extends KinematicBody2D

export var rotation_speed = 1.25
export var acceleration = 1
export var deceleration = .75
export var max_speed = 200

var speed = 0

func _physics_process(delta):
	rotate_ship(delta)
	move_ship(delta)
	if speed > max_speed / 4:
		$CPUParticles2D.emitting = true
	else:
		$CPUParticles2D.emitting = false


func rotate_ship(delta):
	var direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	rotate(direction * delta * rotation_speed)

func move_ship(delta):
	var direction = ($Position2D.global_position - global_position).normalized()
	if Input.is_action_pressed("ui_up") && speed < max_speed:
		speed += Input.get_action_strength("ui_up") * acceleration
	elif speed > 0:
		speed -= deceleration
		
	move_and_slide(direction * speed)
