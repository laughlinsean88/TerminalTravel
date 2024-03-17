class_name MediumInventory
extends Node

var slots : Array[InventorySlotMedium]
@onready var window : Panel = get_node("MediumInventoryWindow")
#@onready var info_text = $"../InfoText"


@export var starter_items : Array[Item]
@export var inRange = false

func _ready ():
	toggle_window(false)
	
	for child in get_node("MediumInventoryWindow/SlotContainerMedium").get_children():
		slots.append(child)
		child.set_item(null)
		child.inventory = self
	
	GlobalSignals.on_give_player_small_item.connect(on_give_player_item)
	GlobalSignals.on_medium_suitcase_open.connect(open_suitcase)
	
	for item in starter_items:
		add_item(item)

func open_suitcase():
	toggle_window(!window.visible)

func toggle_window (open : bool):
	window.visible = open
	
	if open:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func on_give_player_item (item : Item, amount : int):
	for i in range(amount):
		add_item(item)

func add_item (item : Item):
	var slot = get_slot_to_add(item)
	
	if slot == null:
		return
	
	if slot.item == null:
		slot.set_item(item)
	elif slot.item == item:
		slot.add_item()

func remove_item (item : Item):
	var slot = get_slot_to_remove(item)
	
	if slot == null or slot.item == item:
		return
	
	slot.remove_item()

func get_slot_to_add (item : Item) -> InventorySlotMedium:
	for slot in slots:
		if slot.item == item and slot.quantity < item.max_stack_size:
			return slot
	
	for slot in slots:
		if slot.item == null:
			return slot
	
	return null

func get_slot_to_remove (item : Item) -> InventorySlotMedium:
	for slot in slots:
		if slot.item == item:
			return slot
	
	return null

func get_number_of_item (item : Item) -> int:
	var total = 0
	
	for slot in slots:
		if slot.item == item:
			total += slot.quantity
	
	return total
