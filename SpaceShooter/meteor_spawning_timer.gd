extends Timer

var random:RandomNumberGenerator = RandomNumberGenerator.new();

var dirtMeteor:PackedScene  = load("res://dirt_meteor.tscn" );
var stoneMeteor:PackedScene = load("res://stone_meteor.tscn");
var iceMeteor:PackedScene   = load("res://ice_meteor.tscn"  );

func _on_timeout() -> void:
	var newMeteor;

	var identifier = random.randi_range(0, 2);
	match identifier:
		0:
			newMeteor = dirtMeteor.instantiate();
		1:
			newMeteor = stoneMeteor.instantiate();
		2:
			newMeteor = iceMeteor.instantiate();
	$"../Meteors".add_child(newMeteor);
