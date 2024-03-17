class_name Item
extends Resource

@export var display_name : String
@export var icon : Texture2D
@export var size : String
@export var max_stack_size : int = 12
@export var world_item_scene : PackedScene

func _on_use (_player) -> bool:
	print("Use")
	return false
