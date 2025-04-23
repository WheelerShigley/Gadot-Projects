extends CharacterBody2D

var screen_width:int  = 1920; #px
var screen_height:int = 1080; #px
@export var acceleration:float = 20; #(px/s)/s
@export var relectionFrictionConstant:float = 0.25;
var motion:Vector2 = Vector2.ZERO; # (px/s, px/s)

var shot_available:bool = true;
signal shoot(position:Vector2);

#var north_bound:int = 0;
#var east_bound:int  = 0;
#var south_bound:int = 0;
#var west_bound:int  = 0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector2(
		screen_width  * 1.0/2.0,
		screen_height * 7.0/8.0
	);

	#var boundingBox:Rect2 = Rect2();
	#var point:Vector2 = Vector2.ZERO;
	#for index:int in $CollisionPolygon2D.polygon.size():
		#point = $CollisionPolygon2D.polygon.get(index);
		#boundingBox = boundingBox.expand(point);
	#
	#west_bound  = -boundingBox.size.x/2 + boundingBox.get_center().x;
	#east_bound  = +boundingBox.size.x/2 + boundingBox.get_center().x;
	#north_bound = +boundingBox.size.y/2 + boundingBox.get_center().y;
	#south_bound = -boundingBox.size.y/2 + boundingBox.get_center().y;
	#
	#print(north_bound," ", east_bound," ", south_bound," ", west_bound)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta:float) -> void:
	if Input.is_action_pressed("move_up"):
		velocity += Vector2(0,-acceleration);
	if Input.is_action_pressed("move_down"):
		velocity += Vector2(0,acceleration);
	if Input.is_action_pressed("move_left"):
		velocity += Vector2(-acceleration,0);
	if Input.is_action_pressed("move_right"):
		velocity += Vector2(acceleration,0);
	move_and_slide();
	
	if Input.is_action_pressed("shoot") and shot_available:
		shoot.emit(position + $WeaponSystems/leftWeaponPosition.position);
		shoot.emit(position + $WeaponSystems/rightWeaponPosition.position);

		shot_available = false;
		$WeaponSystems/WeaponCooldownTimer.start();

func _on_weapon_cooldown_timer_timeout() -> void:
	shot_available = true;
