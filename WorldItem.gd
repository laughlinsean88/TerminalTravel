class_name WorldItem
extends InteractableObject

@export var item_name : String

func held():
	has_picked_up = true
	GlobalSignals.on_pick_up.emit()
	("stop conveyor movment")
	
func _interact ():
	var item = load("res://Items/Item Data/" + item_name + ".tres")
	
	if item.size == "Small" and SmallInventory.small_full == false:
		GlobalSignals.on_give_player_small_item.emit(item, 1)
		#queue_free()
	if item.size == "Medium" and SmallInventory.medium_full == false:
		GlobalSignals.on_give_player_medium_item.emit(item, 1)
		#queue_free()
	if SmallInventory.small_full == true : 
		print("Small Section Full")
	if SmallInventory.medium_full == true : 
		print("Medium Section Full")
	elif SmallInventory.small_full == true and SmallInventory.medium_full == true:
		print("SMALL INVENTORY FULL")
	


