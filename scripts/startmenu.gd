extends CanvasLayer


@onready var levelmanager: levelmanager = %levelmanager





func _on_start_pressed() -> void:
	hide()
	levelmanager.next_level()


func _on_exit_pressed() -> void:
	get_tree().quit()
