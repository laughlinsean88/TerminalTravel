class_name Score
extends Node3D

var decreaseRate = 5.0  # Happiness decrease rate per second
var scoreLabel
var happiness
var scoreValue = 0

func _ready():
	scoreLabel = $Score
	scoreLabel.text = "Score " + str(scoreValue)
	happiness = 1000
	set_process_input(true)
	
func _process(delta):
	# Update happiness based on decrease rate
	decreaseHappiness(decreaseRate * delta)
	
func _input(event):
	if event is InputEventKey and event.is_action_pressed("score") and event.pressed:
		sendLuggage()

func sendLuggage():
	var size = 1 # var size = luggage.getSize()  -   need to implement getSize() function
	increaseScore(size)
	scoreLabel.text = "Score " + str(scoreValue)
	increaseHappiness(size) 

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
