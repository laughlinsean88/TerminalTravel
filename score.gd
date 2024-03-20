class_name Score
extends Node3D

@onready var main = $".."

var score_label: Label
var score: int = 0
var score_value = 0
@onready var positive = $Positive
@onready var negative = $Negative
@onready var complete = $Complete
@onready var reset = $Reset

const BARSPEED = 5
var current_bar_value = 1000
@onready var progress_bar = $ProgressBar
var happiness: int = 1000
var end = false


func _ready():
	score_label = $Score
	score_label.text = "Score: " + str(score_value)
	GlobalSignals.on_score_update.connect(update_score)
	GlobalSignals.on_complete_case.connect(complete_case)
	start_progress_bar()
	
func _process(delta):
	if !end and progress_bar.value > 0:
		current_bar_value -= BARSPEED * delta
		current_bar_value = max(current_bar_value, 0)
		progress_bar.value = current_bar_value
		happiness = progress_bar.value
		if happiness <= 0:
			print("YOU LOSE")
			reset_level()
			end = true
	else: set_process(false)
	
func start_progress_bar():
	progress_bar.value = happiness
	set_process(true)

func update_score(amount: int):

	if amount > 0: positive.play()
	if amount < 0: negative.play()

	score_value += amount
	score_label.text = "Score: " + str(score_value)

func complete_case():
	complete.play()
	current_bar_value += 100
	
func reset_level():
	reset.play()
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://main.tscn")

