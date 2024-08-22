extends Node2D

var knife_scene := preload("res://elements/knife/knife.tscn")

@onready var knife := $Knife
@onready var timer := $Timer

## Спаун нового ножа
func create_new_knife():
	# берём сцену с ножом
	knife = knife_scene.instantiate()
	# Добавляем её в эту сцену как child
	add_child(knife)
	
## Отслеживаем нажатие игрока по экрану, переопределяя метод
func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.is_pressed() and timer.time_left <= 0:
		knife.throw()
		timer.start()
		
func _on_timer_timeout():
	create_new_knife()
