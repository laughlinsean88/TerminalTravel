class_name WorldItem
extends InteractableObject

@export var item_name : String

func held():
	has_picked_up = true
	GlobalSignals.on_pick_up.emit()
	
func _interact (type : int):
	var item = load("res://Items/Item Data/" + item_name + ".tres")
	
	if type == 1:
		
		if item.size == "Small":
			GlobalSignals.on_give_small_invent_small_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(1)
			if item.hazardous: GlobalSignals.on_score_update.emit(-1)
			queue_free()
		if item.size == "Medium":
			GlobalSignals.on_give_small_invent_medium_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(1)
			if item.hazardous: GlobalSignals.on_score_update.emit(-1)
			queue_free()
	
	if type == 2:
		
		if item.size == "Small":
			GlobalSignals.on_give_med_invent_small_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(1)
			if item.hazardous: GlobalSignals.on_score_update.emit(-1)
			queue_free()
		if item.size == "Medium":
			GlobalSignals.on_give_med_invent_medium_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(1)
			if item.hazardous: GlobalSignals.on_score_update.emit(-1)
			queue_free()
		if item.size == "Large":
			GlobalSignals.on_give_med_invent_large_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(1)
			if item.hazardous: GlobalSignals.on_score_update.emit(-1)
			queue_free()
			
	if type == 3:
		
		if item.size == "Small":
			GlobalSignals.on_give_large_invent_small_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(1)
			if item.hazardous: GlobalSignals.on_score_update.emit(-1)
			queue_free()
		if item.size == "Medium":
			GlobalSignals.on_give_large_invent_medium_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(1)
			if item.hazardous: GlobalSignals.on_score_update.emit(-1)
			queue_free()
		if item.size == "Large":
			GlobalSignals.on_give_large_invent_large_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(1)
			if item.hazardous: GlobalSignals.on_score_update.emit(-1)
			queue_free()
	
	if type == 4:
		if item.hazardous: GlobalSignals.on_score_update.emit(25)
		if !item.hazardous: GlobalSignals.on_score_update.emit(-10)
	


