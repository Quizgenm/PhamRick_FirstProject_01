extends Area2D
class_name stompinf


func _on_body_entered(body :Node2D):
	body.jump(1.05)
	
	print("ooooooh, you almost had them")
	
	
