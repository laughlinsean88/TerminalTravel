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
@onready var score_system = $"../ScoreSystem"

@onready var briefcase = $"../Briefcase"
@onready var medium_suitcase = $"../Medium Suitcase"
@onready var large_suitcase = $"../Large Suitcase"


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

func smallInvent(_item : Item, count : int):
	small_invent_full_count += count
	if small_invent_full_count >= small_max_count:
		briefcase.get_node("AnimNode").close_case()
		small_complete_case = true
		GlobalSignals.on_score_update.emit(10)
		complete_case(1)
	
	else: print("Small Invent Count: " + str(small_invent_full_count))
	
func medInvent(_item : Item, count : int):
	med_invent_full_count += count
	if med_invent_full_count >= med_max_count:
		medium_suitcase.get_node("AnimNode").close_case()
		med_complete_case = true
		GlobalSignals.on_score_update.emit(25)
		complete_case(2)
		
	else: print("Medium Invent Count: " + str(med_invent_full_count))
func largeInvent(_item : Item, count : int):
	large_invent_full_count += count
	if large_invent_full_count >= large_max_count:
		large_suitcase.get_node("AnimNode").close_case()
		large_complete_case = true
		GlobalSignals.on_score_update.emit(50)
		complete_case(3)
	
	else: print("Large Invent Count: " + str(large_invent_full_count))
func complete_case(case : int):
	
	score_system.complete_case()
	
	if case == 1:
		print("SMALL INVENTORY COMPLETED")
		await get_tree().create_timer(2.0).timeout
		briefcase.get_node("AnimNode").open_case()
		GlobalSignals.on_reset_small_suitcase.emit()
		small_invent_full_count = 0
	if case == 2:
		print("MEDIUM INVENTORY COMPLETED")
		await get_tree().create_timer(2.0).timeout
		medium_suitcase.get_node("AnimNode").open_case()
		GlobalSignals.on_reset_med_suitcase.emit()
		med_invent_full_count = 0
	if case == 3:
		print("LARGE INVENTORY COMPLETED")
		await get_tree().create_timer(2.0).timeout
		large_suitcase.get_node("AnimNode").open_case()
		GlobalSignals.on_reset_large_suitcase.emit()
		large_invent_full_count = 0
	



