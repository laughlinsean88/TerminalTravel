extends Node

var menu_instance # Reference to the instance of your menu scene
var game_instance

func _ready():
	var menu_scene = load("res://menuInGame.tscn").instantiate() # Load your menu scene
	var game_scene = load("res://main.tscn").instantiate()
	get_tree().current_scene.add_child(menu_scene)
	menu_instance = menu_scene # Store the menu instance for later use
	game_instance = game_scene
	menu_instance.hide() # Hide the menu initially

func _input(event):
	if event is InputEventKey and event.is_action_pressed("pause") and event.pressed:
		toggle_menu()

func toggle_menu():
	if menu_instance.visible:
		menu_instance.hide()
	else:
		menu_instance.show()

