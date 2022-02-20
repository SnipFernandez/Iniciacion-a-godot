extends VehicleBody

var force = 200

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	engine_force = Input.get_action_strength("ui_up") * force
	brake = Input.get_action_strength("ui_down")
	steering = Input.get_action_strength("ui_left") - Input.get_action_strength("ui_right")
