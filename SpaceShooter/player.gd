extends Node2D

var screen_height:int = 1920; #px
var screen_width:int  = 1080; #px
@export var acceleration:float = 12.5; #(px/s)/s
@export var relectionFrictionConstant:float = 0.25;
var motion:Vector2 = Vector2(0,0); # (px/s, px/s)

var half_width;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(
		screen_height* 1/2,
		screen_width * 7/8
	);
	half_width = $Sprite.texture.get_width()/2;


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Move player
	if Input.is_action_pressed("move_right"):
		motion += delta*Vector2(acceleration,0);
	if Input.is_action_pressed("move_left"):
		motion += delta*Vector2(-acceleration,0);
	$Sprite.position += motion;

	# Sanitize position
	var reflectMotion = false;
	if $Sprite.position.x < -screen_width + half_width:
		$Sprite.position.x = -screen_width + half_width;
		reflectMotion = true;
	if screen_width - half_width < $Sprite.position.x:
		$Sprite.position.x = screen_width - half_width;
		reflectMotion = true;

	# Sanitize motion
	if reflectMotion:
		motion *= -1*relectionFrictionConstant;
