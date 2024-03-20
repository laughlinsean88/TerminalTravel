extends InteractableObject

const BRIEFCASE : String = "Briefcase"
const MEDIUM_CASE : String = "Medium Suitcase"
const LARGE_CASE : String = "Large Suitcase"
const TRASH : String = "Trash"

@export var luggage_name : String
@export var trash_can : bool = false

func _open ():
	if luggage_name == BRIEFCASE and Input.is_action_just_pressed("inventory"):
		GlobalSignals.on_briefcase_open.emit()
	if luggage_name == MEDIUM_CASE and Input.is_action_just_pressed("inventory"):
		GlobalSignals.on_medium_suitcase_open.emit()
	if luggage_name == LARGE_CASE and Input.is_action_just_pressed("inventory"):
		GlobalSignals.on_large_suitcase_open.emit()

func _on_area_3d_body_entered(body):
	
	var type = 0
	
	if body.is_in_group("Item"):
		
		if luggage_name == BRIEFCASE:
			body.set_collision_mask_value(1, false)
			type = 1
			body._interact(type)
			body.queue_free()
			type = 0
		if luggage_name == MEDIUM_CASE:
			type = 2
			body._interact(type)
			body.queue_free()
			type = 0
		if luggage_name == LARGE_CASE:
			type = 3
			body._interact(type)
			body.queue_free()
			type = 0
		if trash_can:
			type = 4
			body._interact(type)
			body.queue_free()
			type = 0

