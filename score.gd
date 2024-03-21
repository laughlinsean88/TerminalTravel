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


@onready var positive_pay = $"../Popups/Positive_Pay" as Label
@onready var negative_pay = $"../Popups/Negative_Pay" as Label
@onready var positive_satisfaction = $"../Popups/Positive_Satisfaction" as Label
@onready var negative_satisfaction = $"../Popups/Negative_Satisfaction" as Label

var speed_inc = 50
@onready var conveyor = $"../Path3D_Conveyor"
@onready var audio = $"../AudioStreamPlayer"

func _ready():
	positive_pay.visible = false
	negative_pay.visible = false
	positive_satisfaction.visible = false
	negative_satisfaction.visible = false
	score_label = $Score
	score_label.text = "Score: " + str(score_value)
	GlobalSignals.on_score_update.connect(update_score)
	GlobalSignals.on_complete_case.connect(complete_case)
	GlobalSignals.on_satisfaction_update.connect(satisfaction)
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
	score_label.text = "Paycheck: $" + str(score_value)
	update_pay_popup(amount)
	
	if score_value >= speed_inc:  
		speed_inc += 50
		conveyor.speed_up()
		audio.pitch_scale += 0.01
		return
	
	
		
func update_pay_popup(amount : int):
	
	if amount > 0: 
		positive_pay.text = "+ " + str(amount)
		positive_pay.visible = true
	if amount < 0: 
		negative_pay.text = str(amount)
		negative_pay.visible = true
	
	await get_tree().create_timer(2.0).timeout
	positive_pay.visible = false
	negative_pay.visible = false
	
func satisfaction(value : int):
	current_bar_value += value
	update_statisfaction_popup(value)
	
func update_statisfaction_popup(value : int):
	
	if value > 0: 
		positive_satisfaction.text = "+ " + str(value)
		positive_satisfaction.visible = true
	if value < 0: 
		negative_satisfaction.text = str(value)
		negative_satisfaction.visible = true
	
	await get_tree().create_timer(2.0).timeout
	positive_satisfaction.visible = false
	negative_satisfaction.visible = false

func complete_case():
	var bonus = 150
	complete.play()
	current_bar_value += bonus
	update_statisfaction_popup(bonus)
	
func reset_level():
	reset.play()
	await get_tree().create_timer(1.0).timeout
	main.toggle_menu()
	GlobalSignals.on_gameover.emit(score_value)

