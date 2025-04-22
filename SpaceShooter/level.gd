extends Node2D

var laser:PackedScene = load("res://laser.tscn");

func _on_player_shoot(position: Vector2) -> void:
	var newLaser = laser.instantiate();
	newLaser.position = position;
	$Lasers.add_child(newLaser);
