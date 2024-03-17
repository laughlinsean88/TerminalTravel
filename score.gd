class_name Score
extends Node3D

@export var item_name : String

var decreaseRate = 5.0  # Happiness decrease rate per second
var score
var happiness

func _ready():
	score = 0
	happiness = 100
	set_process_input(true)
	
func _process(delta):
	# Update happiness based on decrease rate
	decreaseHappiness(decreaseRate * delta)
	
# Function to handle sending luggage
func sendLuggage():
	var size = 1 # var size = luggage.getSize()  -   need to implement getSize() function
	score += size
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

