extends Node2D

var cannon_ball_obj = preload("res://Scenes/Cannon_ball/Cannon_ball.tscn")

func _on_Area2D_body_entered(body):
	if body.name == "Ship":
		var cannon_ball = cannon_ball_obj.instance()
		cannon_ball.global_position = $Path2D/PathFollow2D/Pirate.global_position
		cannon_ball.target_direction = ($Ship.global_position - cannon_ball.global_position).normalized()
		add_child(cannon_ball)
		cannon_ball.set_process(true)
