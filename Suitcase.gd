extends InteractableObject

const BRIEFCASE : String = "Briefcase"
const MEDIUM_CASE : String = "Medium Suitcase"
const LARGE_CASE : String = "Large Suitcase"

@export var luggage_name : String

func _open ():
	if luggage_name == BRIEFCASE and Input.is_action_just_pressed("inventory"):
		GlobalSignals.on_briefcase_open.emit()
	if luggage_name == MEDIUM_CASE and Input.is_action_just_pressed("inventory"):
		GlobalSignals.on_medium_suitcase_open.emit()
	if luggage_name == LARGE_CASE and Input.is_action_just_pressed("inventory"):
		GlobalSignals.on_large_suitcase_open.emit()
