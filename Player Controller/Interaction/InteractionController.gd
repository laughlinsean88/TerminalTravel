extends RayCast3D

@onready var interact_prompt_label : Label = get_node("InteractionPrompt")

@onready var hand = $Marker3D

var is_obj_held: bool = false
 
var holding_obj: InteractableObject = null

var hold_power: int = 10

func _process(delta):
	var object = get_collider()
	interact_prompt_label.text = ""
	
	if object and object is InteractableObject:
		if object.can_interact == false:
			return
		
		interact_prompt_label.text = "[E] " + object.interact_prompt
		
		if Input.is_action_just_pressed("interact"):
			object._interact() 

		if Input.is_action_just_pressed("pick_up"):
			if !is_obj_held:
				holding_obj = object
				object.global_position = hand.global_position
				is_obj_held = true
				print("hold")
			else:
				holding_obj = null
				is_obj_held = false
				print("drop")

	if holding_obj:
		holding_obj.set_linear_velocity((hand.global_position - holding_obj.global_position) * hold_power)
		
