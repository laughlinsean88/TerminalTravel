extends InteractableObject

@export var luggage_name : String

func _open ():
	if luggage_name == "Briefcase" and Input.is_action_just_pressed("inventory"):
		GlobalSignals.on_briefcase_open.emit()
	if luggage_name == "Medium Suitcase" and Input.is_action_just_pressed("inventory"):
		GlobalSignals.on_medium_suitcase_open.emit()
	if luggage_name == "Large Suitcase" and Input.is_action_just_pressed("inventory"):
		GlobalSignals.on_large_suitcase_open.emit()
		
	#var item = load("res://Items/Item Data/" + item_name + ".tres")
	#GlobalSignals.on_give_player_item.emit(item, 1)
	#queue_free()
