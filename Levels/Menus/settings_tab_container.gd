class_name SettingsTabContainer
extends Control

@onready var tab_container = $TabContainer
signal exit_options_menu

func _process(_delta):
	options_menu_input()

func change_tab(tab: int)-> void:
	tab_container.set_current_tab(tab)

func options_menu_input()-> void:
	var max_tab = tab_container.get_tab_count() - 1
	if Input.is_action_just_pressed("move_right"):
		if tab_container.current_tab >= max_tab:
			change_tab(0)
			return
		
		var next_tab = tab_container.current_tab + 1
		change_tab(next_tab)
		
	if Input.is_action_just_pressed("move_left"):
		if tab_container.current_tab == 0:
			change_tab(max_tab)
			return
			
		var previous_tab = tab_container.current_tab - 1
		change_tab(previous_tab)
		
	if Input.is_action_just_pressed("cancel") or Input.is_action_just_pressed("pause"):
		exit_options_menu.emit()

