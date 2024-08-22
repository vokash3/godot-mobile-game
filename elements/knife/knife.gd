extends CharacterBody2D


const SPEED = 4500.0
var is_flying := false


func _physics_process(delta: float) -> void:
	if is_flying:
		var collision = move_and_collide(Vector2.UP * SPEED * delta)
		# Обрабатываем коллизию
		if collision:
			handle_collision(collision)
	
	
func throw():
	is_flying = true
	
	
func handle_collision(collision: KinematicCollision2D):
	var collider := collision.get_collider()
	if collider is Target:
		add_knife_to_target(collider)
		is_flying = false
		
		
func add_knife_to_target(target: Target):
	# Отвязываем нож от родителя
	get_parent().remove_child(self)
	# Точка попадания
	global_position = Target.KNIFE_POSITION
	rotation = 0
	# Привязка ножа к мишени, нож остаётся в ней
	target.add_object_with_pivot(self, -target.rotation)
		
