extends Node2D
class_name levelmanager

@export var level_array : Array[PackedScene]

var current_level : Node2D

static var instance : levelmanager 



func next_level():
	if current_level:
		current_level.queue_free()
	current_level = level_array.pop_front().instantiate()
	add_child(current_level)
