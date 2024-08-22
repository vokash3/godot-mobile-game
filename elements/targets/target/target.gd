extends CharacterBody2D
class_name Target

const KNIFE_POSITION = Vector2(0, 180)

var speed := PI

# Получим ссылку на item_containers
@onready var item_containers := $ItemsContainer

func _physics_process(delta: float) -> void:
	rotation += speed * delta
	
func add_object_with_pivot(object: Node2D, object_rotation: float):
	var pivot := Node2D.new()
	pivot.rotation = object_rotation
	pivot.add_child(object)
	item_containers.add_child(pivot)
