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


func _on_area_3d_body_entered(body):
	if body.is_in_group("Item"):
		body._interact()
		print("Hit Suitcase")
		if luggage_name == BRIEFCASE: 
			body.queue_free()
			print("Hit Briefcase")
		if luggage_name == MEDIUM_CASE or luggage_name == LARGE_CASE: 
			body.get_node("CollisionShape3D").disabled = true
			print("Hit Suitcase")
		
