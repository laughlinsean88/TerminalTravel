extends RayCast3D

@onready var interact_prompt_label : Label = get_node("InteractionPrompt")

@onready var hand = $Marker3D

var g_pressed: bool = false
 
var holding_obj: InteractableObject = null

var hold_power: int = 10


func _process(delta):
	var object = get_collider()
	interact_prompt_label.text = ""
	g_pressed = false
	
	if object and object is InteractableObject:
		if object.can_interact == false:
			return
		
		interact_prompt_label.text = "[E] " + object.interact_prompt
		
		if Input.is_action_just_pressed("interact"):
			object._interact()
		
		if Input.is_action_just_pressed("pick_up") and !g_pressed:
			holding_obj = object
			object.global_position = hand.global_position
			g_pressed = true
			print("hold")

	if holding_obj:
		holding_obj.set_linear_velocity((hand.global_position - holding_obj.global_position) * hold_power)
	if Input.is_action_just_pressed("pick_up") and !g_pressed:
		holding_obj = null
		g_pressed = true
		print("drop")




