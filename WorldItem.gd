class_name WorldItem
extends InteractableObject

@export var item_name : String

func held():
	has_picked_up = true
	GlobalSignals.on_pick_up.emit()
	("stop conveyor movement")
	
func _interact (type : int):
	var item = load("res://Items/Item Data/" + item_name + ".tres")
	
	if type == 0: 
		print("Ground")
		return
	
	if type == 1:
		if item.size == "Small" and SmallInventory.small_full == false:
			GlobalSignals.on_give_small_invent_small_item.emit(item, 1)
			queue_free()
		if item.size == "Medium" and SmallInventory.medium_full == false:
			GlobalSignals.on_give_small_invent_medium_item.emit(item, 1)
			queue_free()
		if SmallInventory.small_full == true : 
			print("Small Section Full: S")
		if SmallInventory.medium_full == true : 
			print("Medium Section Full: S")
		elif SmallInventory.small_full == true and SmallInventory.medium_full == true:
			print("SMALL INVENTORY FULL")
	
	if type == 2:
		if item.size == "Small" and MediumInventory.small_full == false:
			GlobalSignals.on_give_med_invent_small_item.emit(item, 1)
			queue_free()
		if item.size == "Medium" and MediumInventory.medium_full == false:
			GlobalSignals.on_give_med_invent_medium_item.emit(item, 1)
			queue_free()
		if item.size == "Large" and MediumInventory.large_full == false:
			GlobalSignals.on_give_med_invent_large_item.emit(item, 1)
			queue_free()
		if MediumInventory.small_full == true : 
			print("Small Section Full: M")
		if MediumInventory.medium_full == true : 
			print("Medium Section Full: M")
		if MediumInventory.large_full == true : 
			print("Large Section Full: M")
		elif MediumInventory.small_full == true and MediumInventory.medium_full == true and MediumInventory.large_full == true:
			print("MEDIUM INVENTORY FULL")
	
	if type == 3:
		if item.size == "Small" and LargeInventory.small_full == false:
			GlobalSignals.on_give_large_invent_small_item.emit(item, 1)
			queue_free()
		if item.size == "Medium" and LargeInventory.medium_full == false:
			GlobalSignals.on_give_large_invent_medium_item.emit(item, 1)
			queue_free()
		if item.size == "Large" and LargeInventory.large_full == false:
			GlobalSignals.on_give_large_invent_large_item.emit(item, 1)
			queue_free()
		if LargeInventory.small_full == true : 
			print("Small Section Full: L")
		if LargeInventory.medium_full == true : 
			print("Medium Section Full: L")
		if LargeInventory.medium_full == true : 
			print("Large Section Full: L")
		elif LargeInventory.small_full == true and LargeInventory.medium_full == true and LargeInventory.large_full == true:
			print("LARGE INVENTORY FULL")
	
	if type == 4:
		print("TRASH")
		
	
	


