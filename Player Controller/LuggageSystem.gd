class_name LuggageSystem
extends Node3D

var small_invent_full_count = 0
var med_invent_full_count = 0
var large_invent_full_count = 0

var small_complete_case = false
var med_complete_case = false
var large_complete_case = false

var small_max_count = 5
var med_max_count = 8
var large_max_count = 10

func _ready():
	GlobalSignals.on_give_small_invent_small_item.connect(smallInvent)
	GlobalSignals.on_give_small_invent_medium_item.connect(smallInvent)
	GlobalSignals.on_give_small_invent_large_item.connect(smallInvent)
	GlobalSignals.on_give_med_invent_small_item.connect(medInvent)
	GlobalSignals.on_give_med_invent_medium_item.connect(medInvent)
	GlobalSignals.on_give_med_invent_large_item.connect(medInvent)
	GlobalSignals.on_give_large_invent_small_item.connect(largeInvent)
	GlobalSignals.on_give_large_invent_medium_item.connect(largeInvent)
	GlobalSignals.on_give_large_invent_large_item.connect(largeInvent)
	GlobalSignals.on_complete_case.connect(complete_case)

func smallInvent(_item : Item, count : int):
	small_invent_full_count += count
	if small_invent_full_count >= small_max_count:
		small_complete_case = true
		GlobalSignals.on_score_update.emit(10)
		GlobalSignals.on_complete_case.emit(1)
	
	else: print("Small Invent Count: " + str(small_invent_full_count))
	
func medInvent(_item : Item, count : int):
	med_invent_full_count += count
	if med_invent_full_count >= med_max_count:
		med_complete_case = true
		GlobalSignals.on_score_update.emit(25)
		GlobalSignals.on_complete_case.emit(2)
		
	else: print("Medium Invent Count: " + str(med_invent_full_count))
func largeInvent(_item : Item, count : int):
	large_invent_full_count += count
	if large_invent_full_count >= large_max_count:
		large_complete_case = true
		GlobalSignals.on_score_update.emit(50)
		GlobalSignals.on_complete_case.emit(3)
	
	else: print("Large Invent Count: " + str(large_invent_full_count))
func complete_case(case : int):
	if case == 1:
		print("SMALL INVENTORY COMPLETLEY FULL")
	if case == 2:
		print("MEDIUM INVENTORY COMPLETLEY FULL")
	if case == 3:
		print("LARGE INVENTORY COMPLETLEY FULL")
		
	


