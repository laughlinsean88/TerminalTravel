extends RayCast3D

@onready var interact_prompt_label : Label = get_node("InteractionPrompt")
@onready var hand = $"../../Marker3D"

var is_obj_held: bool = false
var holding_obj: InteractableObject = null
var hold_power: int = 10
var tempObj

func _process(_delta):
	var object = get_collider()
	interact_prompt_label.text = ""
	
	if is_obj_held and Input.is_action_just_pressed("pick_up"):
		is_obj_held = false
		holding_obj = null
		hold(null, is_obj_held)
	
	if object and object is InteractableObject:
		if object.can_interact == false:
			return
		
		interact_prompt_label.text = object.interact_prompt
		
		#if Input.is_action_just_pressed("interact"):
			#object._interact()
			#
		if Input.is_action_just_pressed("inventory"):
			object._open()
			
		if Input.is_action_just_pressed("pick_up") and !object.is_luggage:
			if object.is_queued_for_deletion(): return
			
			is_obj_held = true
			holding_obj = object
			hold(object, is_obj_held)
			
	if holding_obj and !holding_obj.is_luggage: 
		holding_obj.set_linear_velocity((hand.global_position - holding_obj.global_position) * hold_power)
		
func hold(object : InteractableObject, is_obj_held_condition : bool):
	
	if is_obj_held_condition:
		tempObj = object
		object.global_position = hand.global_position
		object.held()
		object.get_node("CollisionShape3D").disabled = true
		print("hold")
	
	var heldObj = tempObj
	if !is_obj_held_condition:
		holding_obj = null
		heldObj.get_node("CollisionShape3D").disabled = false
		print("drop")
	
