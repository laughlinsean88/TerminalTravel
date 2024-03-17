extends Node

signal collected(resource : Resource)

func emit_on_collected(resource: Resource)-> void:
	collected.emit(resource)
	
