extends Area2D
class_name stomped


func _on_body_entered(body :Node2D):
	body.jump(1.05)
	get_parent().die()
	print("ya got em")
	
	
