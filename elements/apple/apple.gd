extends Node2D

var is_hited: bool = false


# Подписались на событие Area2D. Ловим сигнал попадания в зону
func _on_area_2d_body_entered(body: Node2D) -> void:
	if not is_hited:
		is_hited = true
		# Удаляем яблоко со сцены
		queue_free()
