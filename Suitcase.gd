extends InteractableObject

const BRIEFCASE : String = "Briefcase"
const MEDIUM_CASE : String = "Medium Suitcase"
const LARGE_CASE : String = "Large Suitcase"
const TRASH : String = "Trash"

@export var luggage_name : String

func _open ():
	if luggage_name == BRIEFCASE and Input.is_action_just_pressed("inventory"):
		GlobalSignals.on_briefcase_open.emit()
	if luggage_name == MEDIUM_CASE and Input.is_action_just_pressed("inventory"):
		GlobalSignals.on_medium_suitcase_open.emit()
	if luggage_name == LARGE_CASE and Input.is_action_just_pressed("inventory"):
		GlobalSignals.on_large_suitcase_open.emit()


func _on_area_3d_body_entered(body):
	if body.is_in_group("Item"):
		var type = 0
		if luggage_name == BRIEFCASE: 
			body.queue_free()
			type = 1
			print("Hit: Briefcase")
		if luggage_name == MEDIUM_CASE:
			body.set_collision_mask_value(1, false)
			type = 2
			print("Hit: " + str(luggage_name))
		if luggage_name == LARGE_CASE:
			body.set_collision_mask_value(1, false)
			type = 3
			print("Hit: " + str(luggage_name))
		if luggage_name == TRASH:
			body.queue_free()
			type = 4
			print("Trash")
		body._interact(type)
		

