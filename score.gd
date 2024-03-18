class_name Score
extends Node3D

var decreaseRate = 5.0  # Happiness decrease rate per second
var scoreLabel
var happiness
var score
var scoreValue = 0

func _ready():
	scoreLabel = $Score
	scoreLabel.text = "Score " + str(scoreValue)
	happiness = 1000
	set_process_input(true)
	
func _process(delta):
	# Update happiness based on decrease rate
	decreaseHappiness(decreaseRate * delta)	

func updateScore(amount: int):
	increaseScore(amount)
	increaseHappiness(amount) 
	scoreLabel.text = "Score " + str(scoreValue)

# Function to increase happiness
func increaseHappiness(amount: int):
	happiness += amount
	happiness = min(happiness, 100)

# Function to decrease happiness over time
func decreaseHappiness(amount: float):
	happiness -= amount
	if happiness <= 0:
		print("you lose")

func increaseScore(amount: int):
	scoreValue += amount

func decreaseScore(amount : int):
	scoreValue -= amount
