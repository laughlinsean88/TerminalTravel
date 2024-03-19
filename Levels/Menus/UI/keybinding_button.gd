class_name KeybindingButton
extends Control

@onready var label = $HBoxContainer/Label as Label
@onready var button = $HBoxContainer/Button as Button

@export var action_name : String = "jump"
var pressed = false

func _ready():
	set_process_unhandled_key_input(false)
	set_action_name()
	set_text_for_keys()
	#load_keybinds()

func load_keybinds() -> void:
	rebind_action_key(SettingsContainer.get_keybind(action_name))

func set_action_name() -> void:
	label.text = "unassigned"
	
	match action_name:
		"move_forward":
			label.text = "Move Forward"
		"move_back":
			label.text = "Move Back"
		"move_left":
			label.text = "Move Left"
		"move_right":
			label.text = "Move Right"
		"jump":
			label.text = "Jump"
		"attack":
			label.text = "Attack"
		"shield":
			label.text = "Shield"
		"pick_up":
			label.text = "Pick Up"
		"tab_right":
			label.text = "Tab Right"
		"tab_left":
			label.text = "Tab Left"
		"inventory":
			label.text = "Inventory"
		"pause":
			label.text = "Pause"
		"cancel":
			label.text = "Cancel/Back"
	
@warning_ignore("unused_variable")
func set_text_for_keys() -> void:
	var action_events = InputMap.action_get_events(action_name)
	if action_events.size() > 0:
		var action_event = action_events[0]
		if action_event is InputEventKey:
			var action_keycode = OS.get_keycode_string(action_event.physical_keycode)
			button.text = "%s" % action_keycode
		elif action_event is InputEventMouseButton:
			var action_keycode = OS.get_keycode_string(action_event.button_index)
			button.text = "%s" % "Mouse Button " + str(action_event.button_index)
	
func _on_button_toggled(toggled_on):
	if toggled_on:
		button.text = "Press Any Key..."
		set_process_unhandled_key_input(toggled_on)
		
		for i in get_tree().get_nodes_in_group("keybind_button"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = false
				i.set_process_unhandled_key_input(false)
	else:
		
		for i in get_tree().get_nodes_in_group("keybind_button"):
			if i.action_name != self.action_name:
				i.button.toggle_mode = true
				i.set_process_unhandled_key_input(false)
				
		set_text_for_keys()		
	
func _unhandled_key_input(event):
	rebind_action_key(event)
	button.button_pressed = false

	#var is_duplicate=false
	#var action_events = InputMap.action_get_events(action_name)
	#if action_events.size() > 0:
		#var action_event = event
		#var action_keycode = OS.get_keycode_string(action_event.physical_keycode)
		#for i in get_tree().get_nodes_in_group("keybind_button"):
				#if i.action_name!=self.action_name:
					#if i.button.text=="%s" %action_keycode:
						#is_duplicate=true
						#break
		#if not is_duplicate:
func rebind_action_key(event) -> void:
	InputMap.action_erase_events(action_name)
	InputMap.action_add_event(action_name, event)
	set_process_unhandled_key_input(false)
	set_text_for_keys()
	set_action_name()



