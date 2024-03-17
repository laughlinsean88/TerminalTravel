extends Node

signal set_camera_target(target : CharacterBody2D)

func emit_set_camera_target(target : CharacterBody2D)-> void:
	print("Setting current target: " + str(target.name))
	set_camera_target.emit(target)
