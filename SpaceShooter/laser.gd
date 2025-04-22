extends Area2D

@export var speed = 1000; #px/s

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y -= speed * delta;
