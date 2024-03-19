class_name Score
extends Node3D

var decreaseRate = 5.0  # Happiness decrease rate per second
var scoreLabel
var happiness
var score
var scoreValue = 0
@onready var positive = $Positive
@onready var negative = $Negative
@onready var complete = $Complete

func _ready():
	scoreLabel = $Score
	scoreLabel.text = "Score " + str(scoreValue)
	happiness = 1000
	set_process_input(true)
	GlobalSignals.on_score_update.connect(updateScore)
	GlobalSignals.on_complete_case.connect(complete_case)
	
func _process(_delta):
	pass
	# Update happiness based on decrease rate
	#decreaseHappiness(decreaseRate * delta)	

func updateScore(amount: int):
	increaseScore(amount)
	if amount > 0: positive.play()
	if amount < 0: negative.play()
	#increaseHappiness(amount) 
	scoreLabel.text = "Score: " + str(scoreValue)

## Function to increase happiness
#func increaseHappiness(amount: int):
	#happiness += amount
	#happiness = min(happiness, 100)
#
## Function to decrease happiness over time
#func decreaseHappiness(amount: float):
	#happiness -= amount
	#if happiness <= 0:
		#print("you lose")

func increaseScore(amount: int):
	scoreValue += amount
	
func decreaseScore(amount : int):
	scoreValue -= amount

func complete_case():
	complete.play(0)

