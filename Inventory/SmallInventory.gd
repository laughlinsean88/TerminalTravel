class_name SmallInventory
extends Node

var small_slots : Array[InventorySlotSmall]
var medium_slots : Array[InventorySlotMedium]

@onready var window : Panel = get_node("SmallInventoryWindow")
@onready var info_text = $SmallInventoryWindow/InfoText

@export var starter_small_items : Array[Item]
@export var starter_medium_items : Array[Item]

static var small_full = false
static var medium_full = false

var small_count = 0
var max_small_slots = 4
var medium_count = 0
var max_medium_slots = 1

func _ready ():
	toggle_window(false)
	
	for child in get_node("SmallInventoryWindow/SlotContainerSmall").get_children():
		small_slots.append(child)
		child.set_item(null)
		child.inventory = self
	
	for child in get_node("SmallInventoryWindow/SlotContainerMedium").get_children():
		medium_slots.append(child)
		child.set_item(null)
		child.inventory = self
		
	
	GlobalSignals.on_give_small_invent_small_item.connect(on_give_player_small_item)
	GlobalSignals.on_give_small_invent_medium_item.connect(on_give_player_medium_item)
	GlobalSignals.on_briefcase_open.connect(open_suitcase)
	
	for item in starter_small_items:
		add_small_item(item)
		
	for item in starter_medium_items:
		add_medium_item(item)
		

func open_suitcase():
	toggle_window(!window.visible)

func toggle_window (open : bool):
	window.visible = open
	
	if open:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func on_give_player_small_item (item : Item, amount : int):
	for i in range(amount):
		add_small_item(item)

func add_small_item (item : Item):
	var slot = get_small_slot_to_add(item)

	if slot == null:
		return
		
	small_count += 1
	
	if small_count >= max_small_slots: 
		small_full = true
		print("Max amount for small section")
	if slot.item == null:
		slot.set_item(item)
	elif slot.item == item:
		slot.add_item()
		
func remove_small_item (item : Item):
	var slot = get_small_slot_to_remove(item)
	
	if slot == null or slot.item == item:
		return
		
	small_count -= 1
	
	if small_count < max_small_slots: small_full = false
	slot.remove_item()

func get_small_slot_to_add (item : Item) -> InventorySlotSmall:
	for slot in small_slots:
		if slot.item == item and slot.quantity < item.max_stack_size:
			return slot
	
	for slot in small_slots:
		if slot.item == null:
			return slot
	
	return null

func get_small_slot_to_remove (item : Item) -> InventorySlotSmall:
	for slot in small_slots:
		if slot.item == item:
			return slot
	
	return null

func on_give_player_medium_item (item : Item, amount : int):
	for i in range(amount):
		add_medium_item(item)
	
func add_medium_item (item : Item):
	var slot = get_medium_slot_to_add(item)
	
	if slot == null:
		return
		
	medium_count += 1
	
	if medium_count >= max_medium_slots: 
		medium_full = true
		print("Max amount for medium section")
	if slot.item == null:
		slot.set_item(item)
	elif slot.item == item:
		slot.add_item()

func remove_medium_item (item : Item):
	var slot = get_medium_slot_to_remove(item)
	
	if slot == null or slot.item == item:
		return
		
	medium_count -= 1
	if medium_count < max_small_slots: medium_full = false
	
	slot.remove_item()
	
func get_medium_slot_to_add (item : Item) -> InventorySlotMedium:
	for slot in medium_slots:
		if slot.item == item and slot.quantity < item.max_stack_size:
			return slot
	
	for slot in medium_slots:
		if slot.item == null:
			return slot
	
	return null

func get_medium_slot_to_remove (item : Item) -> InventorySlotMedium:
	for slot in medium_slots:
		if slot.item == item:
			return slot
	
	return null

func get_number_of_small_item (item : Item) -> int:
	var total = 0
	
	for slot in small_slots:
		if slot.item == item:
			total += slot.quantity
	
	return total

func get_number_of_medium_item (item : Item) -> int:
	var total = 0
	
	for slot in medium_slots:
		if slot.item == item:
			total += slot.quantity
	
	return total

