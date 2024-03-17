class_name MainMenu
extends CanvasLayer

@onready var start_button = $Control/MarginContainer/HBoxContainer/VBoxContainer/Start as Button
@onready var load_button = $Control/MarginContainer/HBoxContainer/VBoxContainer/Load as Button
@onready var options_button = $Control/MarginContainer/HBoxContainer/VBoxContainer/Options as Button
@onready var quit_button = $Control/MarginContainer/HBoxContainer/VBoxContainer/Quit as Button
@onready var start_level = preload("res://main.tscn") as PackedScene
@onready var options_menu = $Control/OptionsMenu as OptionsMenu
@onready var margin_container = $Control/MarginContainer as MarginContainer


func _ready() -> void:
	handle_signals()

func on_start_pressed() -> void:
	get_tree().change_scene_to_packed(start_level)

func on_options_pressed() -> void:
	margin_container.visible = false
	options_menu.set_process(true)
	options_menu.visible = true

func on_exit_options_menu() -> void:
	options_menu.visible = false
	margin_container.visible = true

func on_quit_pressed() -> void:
	get_tree().quit()
	
func handle_signals() -> void:
	start_button.button_down.connect(on_start_pressed)
	options_button.button_down.connect(on_options_pressed)
	options_menu.on_exit_options_pressed.connect(on_exit_options_menu)
	quit_button.button_down.connect(on_quit_pressed)
