extends Control

@onready var label = $Label
@onready var paycheck = $Paycheck

func _ready():
	GlobalSignals.on_gameover.connect(toggle_popup)

func _on_restart_pressed():
	get_tree().change_scene_to_file("res://main.tscn")
	MainScene.fired = false

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Levels/Menus/main_menu.tscn")

func toggle_popup(score : int):
	MainScene.fired = true
	label.visible = true
	paycheck.text = "Severance Pay: $ " +str(score)
	paycheck.visible = true
