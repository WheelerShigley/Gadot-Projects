extends Area2D

var random:RandomNumberGenerator = RandomNumberGenerator.new();
@export var speed = 50; #px/s
@export var angular_velocity = 0.2; #r/s

func _ready() -> void:
	var width = get_viewport().get_visible_rect().size.x;
	var randomX = random.randi_range(0, width);
	var randomY = random.randi_range(-100,-200);
	var randomS = random.randf_range(1-0.2,1+0.2);
	var randomV = random.randf_range(speed/2,2*speed);
	var randomW = random.randf_range(-angular_velocity,angular_velocity);
	
	scale = Vector2(randomS, randomS);
	angular_velocity = randomW;
	speed = randomV;
	position = Vector2(randomX, randomY);

func _process(delta: float) -> void:
	rotation += angular_velocity * delta;
	position += Vector2(0, speed) * delta;

func _on_body_entered(body: Node2D) -> void:
	print("collision");
