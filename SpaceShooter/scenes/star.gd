extends Node2D

var random:RandomNumberGenerator = RandomNumberGenerator.new();
@export var maximum_idle_time:float = 15.0; #s
var wait_time:float = randf_range(0, maximum_idle_time);
var played_time:float = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = random.randi_range(0, int(get_viewport().get_visible_rect().size.x) );
	position.y = random.randi_range(0, int(get_viewport().get_visible_rect().size.y) );

	var scaler:float = randf_range(0.1,1.0);
	scale = Vector2(scaler, scaler);

	rotation = randf_range(0, TAU);

	var speed:float = randf_range(0.1,1.0)
	$AnimatedSprite2D.speed_scale = speed;
	maximum_idle_time *= speed;

	$AnimatedSprite2D.play("idle");

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	wait_time -= delta;

	if wait_time <= 0:
		wait_time = randf_range(maximum_idle_time/2.0, maximum_idle_time);
		$AnimatedSprite2D.play("twinkle");
