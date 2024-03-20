class_name MainScene
extends Node

var menu_instance # Reference to the instance of your menu scene
static var fired = false

func _ready():
	var menu_scene = load("res://menuInGame.tscn").instantiate()
	get_tree().current_scene.add_child(menu_scene)
	menu_instance = menu_scene # Store the menu instance for later use
	menu_instance.hide() # Hide the menu initially
	
func _input(event):
	if fired: return
	if event is InputEventKey and event.is_action_pressed("pause") and event.pressed:
		toggle_menu()

func toggle_menu():
	if menu_instance.visible:
		menu_instance.hide()
	else:
		menu_instance.show()

