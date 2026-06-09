extends Area2D
class_name flag





func _on_body_entered(_body:Node2D) -> void: 
	levelmanager.instance.next_level()
	
