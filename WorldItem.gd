class_name WorldItem
extends InteractableObject

@export var item_name : String

func held():
	has_picked_up = true
	GlobalSignals.on_pick_up.emit()
	
func _interact (type : int):
	var item = load("res://Items/Item Data/" + item_name + ".tres")
	
	if type == 1:
		
		var small_full = false
		var medium_full = false
		var full_count = 0
		var max_count = 5
		var complete_case = false
		
		if item.size == "Small" and !small_full:
			GlobalSignals.on_give_small_invent_small_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(1)
			if item.hazardous: GlobalSignals.on_score_update.emit(-1)
			var small_count = 0
			small_count += 1
			full_count += small_count
			if small_count == 4: small_full = true
			queue_free()
		if item.size == "Medium" and !medium_full:
			GlobalSignals.on_give_small_invent_medium_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(1)
			if item.hazardous: GlobalSignals.on_score_update.emit(-1)
			var med_count = 0
			med_count += 1
			full_count += med_count
			if med_count == 1: medium_full = true
			queue_free()
		if small_full == true : 
			print("INVENTORY SMALL: Small Section Full")
		if medium_full == true : 
			print("INVENTORY SMALL: Medium Section Full")
		if full_count >= max_count:
			complete_case = true
			GlobalSignals.on_score_update.emit(10)
			GlobalSignals.on_complete_case.emit()
			print("SMALL INVENTORY COMPLETLEY FULL")
		else: print(full_count)
			
	
	if type == 2:
		
		var small_full = false
		var medium_full = false
		var large_full = false
		var full_count = 0
		var max_count = 5
		var complete_case = false
		
		if item.size == "Small" and !small_full:
			var small_count = 0
			GlobalSignals.on_give_med_invent_small_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(1)
			if item.hazardous: GlobalSignals.on_score_update.emit(-1)
			small_count += 1
			full_count += small_count
			if small_count == 4: small_full = true
			queue_free()
		if item.size == "Medium" and !medium_full:
			var med_count = 0
			GlobalSignals.on_give_med_invent_medium_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(1)
			if item.hazardous: GlobalSignals.on_score_update.emit(-1)
			med_count += 1
			full_count += med_count
			if med_count == 1: medium_full = true
			queue_free()
		if item.size == "Large" and !large_full:
			var large_count = 0
			GlobalSignals.on_give_med_invent_large_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(1)
			if item.hazardous: GlobalSignals.on_score_update.emit(-1)
			large_count += 1
			full_count += large_count
			if large_count == 1: large_full = true
			queue_free()
		if small_full == true : 
			print("INVENTORY MEDIUM: Small Section Full")
		if medium_full == true : 
			print("INVENTORY MEDIUM: Medium Section Full")
		if large_full == true : 
			print("INVENTORY MEDIUM: Large Section Full")
		if full_count >= max_count:
			complete_case = true
			print("MEDIUM INVENTORY COMPLETLEY FULL")
			GlobalSignals.on_score_update.emit(25)
			GlobalSignals.on_complete_case.emit()
		else: print(full_count)
			
	if type == 3:
		
		var small_full = false
		var medium_full = false
		var large_full = false
		var full_count = 0
		var max_count = 10
		var complete_case = false
		
		if item.size == "Small" and !small_full:
			var small_count = 0
			GlobalSignals.on_give_large_invent_small_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(1)
			if item.hazardous: GlobalSignals.on_score_update.emit(-1)
			small_count += 1
			full_count += small_count
			if small_count == 6: small_full = true
			queue_free()
		if item.size == "Medium" and !medium_full:
			var med_count = 0
			GlobalSignals.on_give_large_invent_medium_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(1)
			if item.hazardous: GlobalSignals.on_score_update.emit(-1)
			med_count += 1
			full_count += med_count
			if med_count == 2: medium_full = true
			queue_free()
		if item.size == "Large" and !large_full:
			var large_count = 0
			GlobalSignals.on_give_large_invent_large_item.emit(item, 1)
			if !item.hazardous: GlobalSignals.on_score_update.emit(1)
			if item.hazardous: GlobalSignals.on_score_update.emit(-1)
			large_count += 1
			full_count += large_count
			if large_count == 2: large_full = true
			queue_free()
		if small_full == true : 
			print("INVENTORY LARGE: Small Section Full")
		if medium_full == true : 
			print("INVENTORY LARGE: Medium Section Full")
		if large_full == true : 
			print("INVENTORY LARGE: Large Section Full")
		if full_count >= max_count:
			print("LARGE INVENTORY COMPLETLEY FULL")
			GlobalSignals.on_score_update.emit(50)
			GlobalSignals.on_complete_case.emit()
		else: print(full_count)
	
	if type == 4:
		if item.hazardous: GlobalSignals.on_score_update.emit(25)
		if !item.hazardous: GlobalSignals.on_score_update.emit(-10)
	


	


