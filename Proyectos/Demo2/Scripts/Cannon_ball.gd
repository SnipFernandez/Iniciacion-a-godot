extends Sprite

export var speed = 200
var target_direction
var delta_acc = 0

func _ready():
	set_process(false)

func _process(delta):
	position += target_direction * delta * speed
	delta_acc += delta
	if delta_acc > 5:
		queue_free()
