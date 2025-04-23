extends Node2D

var laser:PackedScene = load("res://scenes/laser.tscn");
var star:PackedScene = load("res://scenes/star.tscn");

func _ready() -> void:
	for n in 100:
		var newStar = star.instantiate();
		$Background/Stars.add_child(newStar);

func _on_player_shoot(pos: Vector2) -> void:
	var newLaser = laser.instantiate();
	newLaser.position = pos;
	$Lasers.add_child(newLaser);
