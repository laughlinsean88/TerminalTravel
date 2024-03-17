class_name InteractableObject
extends Node3D

@export var interact_prompt : String
@export var can_interact : bool = true
@export var is_luggage = false

func _interact():
	print("Override this function.")

func _open():
	pass
	#print("Override this function.")
