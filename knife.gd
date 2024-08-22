extends CharacterBody2D


const SPEED = 4500.0
var is_flying := false


func _physics_process(delta: float) -> void:
	if is_flying:
		var collision = move_and_collide(Vector2.UP * SPEED * delta)
	
	
func throw():
	is_flying = true
