class_name InteractableObject
extends Node3D

@export var interact_prompt : String
@export var can_interact : bool = true
@export var is_luggage = false
@export var has_picked_up = false

func _interact(type : int):
	print("Override this function.")

func _open():
	pass
	#print("Override this function.")
