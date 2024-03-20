class_name WorldItem
extends InteractableObject

@export var item_name : String

func held():
	has_picked_up = true
	GlobalSignals.on_pick_up.emit()
	
func _interact (type : int):
	var item = load("res://Items/Item Data/" + item_name + ".tres")
	
	if type == 1:
		
		if item.size == "Small" and !SmallInventory.small_maxed:
			GlobalSignals.on_give_small_invent_small_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(1)
			if item.hazardous: 
				GlobalSignals.on_score_update.emit(-1)
				GlobalSignals.on_satisfaction_update.emit(-10)
			queue_free()
		if item.size == "Medium" and !SmallInventory.med_maxed:
			GlobalSignals.on_give_small_invent_medium_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(5)
			if item.hazardous: 
				GlobalSignals.on_score_update.emit(-5)
				GlobalSignals.on_satisfaction_update.emit(-50)
			queue_free()
	
	if type == 2:
		
		if item.size == "Small" and !MediumInventory.small_maxed:
			GlobalSignals.on_give_med_invent_small_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(1)
			if item.hazardous: 
				GlobalSignals.on_score_update.emit(-1)
				GlobalSignals.on_satisfaction_update.emit(-10)
			queue_free()
		if item.size == "Medium" and !MediumInventory.med_maxed:
			GlobalSignals.on_give_med_invent_medium_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(5)
			if item.hazardous: 
				GlobalSignals.on_score_update.emit(-5)
				GlobalSignals.on_satisfaction_update.emit(-50)
			queue_free()
		if item.size == "Large" and !MediumInventory.large_maxed:
			GlobalSignals.on_give_med_invent_large_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(10)
			if item.hazardous: 
				GlobalSignals.on_score_update.emit(-10)
				GlobalSignals.on_satisfaction_update.emit(-100)
			queue_free()
			
	if type == 3:
		
		if item.size == "Small" and !LargeInventory.small_maxed:
			GlobalSignals.on_give_large_invent_small_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(1)
			if item.hazardous: 
				GlobalSignals.on_score_update.emit(-1)
				GlobalSignals.on_satisfaction_update.emit(-10)
			queue_free()
		if item.size == "Medium" and !LargeInventory.med_maxed:
			GlobalSignals.on_give_large_invent_medium_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(5)
			if item.hazardous: 
				GlobalSignals.on_score_update.emit(-5)
				GlobalSignals.on_satisfaction_update.emit(-50)
			queue_free()
		if item.size == "Large" and !LargeInventory.large_maxed:
			GlobalSignals.on_give_large_invent_large_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(10)
			if item.hazardous: 
				GlobalSignals.on_score_update.emit(-10)
				GlobalSignals.on_satisfaction_update.emit(-100)
			queue_free()
	
	if type == 4:
		if item.hazardous: GlobalSignals.on_score_update.emit(25)
		if !item.hazardous: GlobalSignals.on_score_update.emit(-25)
	


