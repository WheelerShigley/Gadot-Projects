extends Area2D

@export var speed = 1200; #px/s
@export var decompression_time = 0.15; #s

func _ready() -> void:
	var initializationScaling:Tween = create_tween();
	initializationScaling.tween_property(
		$Sprite,
		"scale",
		Vector2(1.0,1.0),
		decompression_time
	).from(
		Vector2.ZERO
	);

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y -= speed * delta;
