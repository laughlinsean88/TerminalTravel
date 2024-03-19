class_name OptionsMenu
extends Control

@onready var exit_button = $MarginContainer/VBoxContainer/Exit as Button
@onready var settings_tab_container = $MarginContainer/VBoxContainer/SettingsTabContainer as SettingsTabContainer

signal on_exit_options_pressed()

func _ready():
	exit_button.button_down.connect(on_exit_pressed)
	settings_tab_container.exit_options_menu.connect(on_exit_pressed)
	set_process(false)

func on_exit_pressed():
	on_exit_options_pressed.emit()
	SettingsSignalBus.emit_set_settings_dictionary(SettingsContainer.create_storage_dictionary())
	set_process(false)

