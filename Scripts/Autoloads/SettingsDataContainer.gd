extends Node

@onready var DEFAULT_SETTINGS : DefaultSettingsResource = preload("res://Levels/Menus/Resources/Settings/defaultsettings.tres")
@onready var KEYBINDING_PLAYER: KeybindingResource = preload("res://Levels/Menus/Resources/Settings/keybinding_player.tres")
var window_mode : int = 0
var resolution_mode : int = 0
var master_volume: float = 50.00
var music_volume: float = 100.00
var sfx_volume: float = 100.00
var ambience_volume: float = 100.00
var speech_volume: float = 100.00
var mute_state : bool = false

var loaded_data : Dictionary = {}

func _ready():
	handle_signals()
	create_storage_dictionary()

func handle_signals() -> void:
	
	SettingsSignalBus.on_windows_mode_selected.connect(on_windows_mode_selected)
	SettingsSignalBus.on_resolution_selected.connect(on_resolution_selected)
	SettingsSignalBus.on_master_volume_set.connect(on_master_volume_set)
	SettingsSignalBus.on_music_volume_set.connect(on_music_volume_set)
	SettingsSignalBus.on_sfx_volume_set.connect(on_sfx_volume_set)
	SettingsSignalBus.on_ambience_volume_set.connect(on_ambience_volume_set)
	SettingsSignalBus.on_speech_volume_set.connect(on_speech_volume_set)
	SettingsSignalBus.on_mute_toggled.connect(on_mute_toggled)
	SettingsSignalBus.load_settings_data.connect(on_settings_load)

func create_storage_dictionary() -> Dictionary:
	var settings_container_dict : Dictionary = {
		"window_mode" : window_mode,
		"resolution_mode" : resolution_mode,
		"master_volume" : master_volume,
		"music_volume" : music_volume,
		"sfx_volume" : sfx_volume,
		"ambience_volume" : ambience_volume,
		"speech_volume" : speech_volume,
		"mute_state" : mute_state,
		"keybinds" : create_keybinds_dictionary()
		}

	return settings_container_dict

func create_keybinds_dictionary() -> Dictionary:
	var keybinds_container_dict : Dictionary = {
		KEYBINDING_PLAYER.MOVE_FORWARD : KEYBINDING_PLAYER.move_forward_key,
		KEYBINDING_PLAYER.MOVE_BACK : KEYBINDING_PLAYER.move_back_key,
		KEYBINDING_PLAYER.MOVE_LEFT : KEYBINDING_PLAYER.move_left_key,
		KEYBINDING_PLAYER.MOVE_RIGHT : KEYBINDING_PLAYER.move_right_key,
		KEYBINDING_PLAYER.JUMP : KEYBINDING_PLAYER.jump_key,
		KEYBINDING_PLAYER.SPRINT : KEYBINDING_PLAYER.sprint_key,
		KEYBINDING_PLAYER.INVENTORY : KEYBINDING_PLAYER.inventory_key,
		KEYBINDING_PLAYER.PICK_UP : KEYBINDING_PLAYER.pick_up_key,
		KEYBINDING_PLAYER.PAUSE : KEYBINDING_PLAYER.pause_key,
		KEYBINDING_PLAYER.CANCEL : KEYBINDING_PLAYER.cancel_key,
	}
	
	return keybinds_container_dict

func on_windows_mode_selected(index : int) -> void:
	window_mode = index	
func on_resolution_selected(index : int) -> void:
	resolution_mode = index
func on_master_volume_set(volume : float) -> void:
	master_volume = volume
func on_music_volume_set(volume : float) -> void:
	music_volume = volume
func on_sfx_volume_set(volume : float) -> void:
	sfx_volume = volume
func on_ambience_volume_set(volume : float) -> void:
	ambience_volume = volume
func on_speech_volume_set(volume : float) -> void:
	speech_volume = volume	
func on_mute_toggled(value: bool) -> void:
	mute_state = value
func set_keybinds(action: String, event) -> void:
	match action:
		KEYBINDING_PLAYER.MOVE_FORWARD:
			KEYBINDING_PLAYER.move_forward_key = event
		KEYBINDING_PLAYER.MOVE_BACK:
			KEYBINDING_PLAYER.move_back_key = event
		KEYBINDING_PLAYER.MOVE_LEFT:
			KEYBINDING_PLAYER.move_left_key = event
		KEYBINDING_PLAYER.MOVE_RIGHT:
			KEYBINDING_PLAYER.move_right_key = event
		KEYBINDING_PLAYER.JUMP:
			KEYBINDING_PLAYER.jump_key = event
		KEYBINDING_PLAYER.SPRINT:
			KEYBINDING_PLAYER.sprint_key = event
		KEYBINDING_PLAYER.INVENTORY:
			KEYBINDING_PLAYER.inventory_key = event
		KEYBINDING_PLAYER.PICK_UP:
			KEYBINDING_PLAYER.pick_up_key = event
		KEYBINDING_PLAYER.PAUSE:
			KEYBINDING_PLAYER.pause_key = event
		KEYBINDING_PLAYER.CANCEL:
			KEYBINDING_PLAYER.cancel_key = event
			
func on_keybinds_loaded(data :Dictionary) -> void:
	var loaded_move_forward = InputEventKey.new()
	var loaded_move_back = InputEventKey.new()
	var loaded_move_left = InputEventKey.new()
	var loaded_move_right = InputEventKey.new()
	var loaded_jump = InputEventKey.new()
	var loaded_sprint = InputEventKey.new()
	var loaded_inventory = InputEventKey.new()
	var loaded_pick_up = InputEventKey.new()
	var loaded_pause = InputEventKey.new()
	var loaded_cancel = InputEventKey.new()
	
	loaded_move_forward.set_physical_keycode(int(data.move_forward))
	loaded_move_back.set_physical_keycode(int(data.move_back))
	loaded_move_left.set_physical_keycode(int(data.move_left))
	loaded_move_right.set_physical_keycode(int(data.move_right))
	loaded_jump.set_physical_keycode(int(data.jump))
	loaded_sprint.set_physical_keycode(int(data.sprint))
	loaded_inventory.set_physical_keycode(int(data.inventory))
	loaded_pick_up.set_physical_keycode(int(data.pick_up))
	loaded_pause.set_physical_keycode(int(data.pause))
	loaded_cancel.set_physical_keycode(int(data.cancel))
	
	KEYBINDING_PLAYER.move_forward_key = loaded_move_forward
	KEYBINDING_PLAYER.move_back_key = loaded_move_back
	KEYBINDING_PLAYER.move_left_key = loaded_move_left
	KEYBINDING_PLAYER.move_right_key = loaded_move_right
	KEYBINDING_PLAYER.jump_key = loaded_jump
	KEYBINDING_PLAYER.sprint_key = loaded_sprint
	KEYBINDING_PLAYER.inventory_key = loaded_inventory
	KEYBINDING_PLAYER.pick_up_key = loaded_pick_up
	KEYBINDING_PLAYER.pause_key = loaded_pause
	KEYBINDING_PLAYER.cancel_key = loaded_cancel
	

func on_settings_load(data : Dictionary) -> void:
	loaded_data = data
	on_windows_mode_selected(loaded_data.window_mode)
	on_resolution_selected(loaded_data.resolution_mode)
	on_master_volume_set(loaded_data.master_volume)
	on_music_volume_set(loaded_data.music_volume)
	on_sfx_volume_set(loaded_data.sfx_volume)
	on_ambience_volume_set(loaded_data.ambience_volume)
	on_speech_volume_set(loaded_data.speech_volume)
	on_mute_toggled(loaded_data.mute_state)
	on_keybinds_loaded(loaded_data.keybinds)
	
func get_window_mode_index() -> int:
	if loaded_data == {}: 
		return DEFAULT_SETTINGS.WINDOW_MODE
	return window_mode
func get_resolution_mode_index() -> int:
	if loaded_data == {}: 
		return DEFAULT_SETTINGS.RESOLUTION_MODE
	return resolution_mode
func get_master_volume() -> float:
	if loaded_data == {}: 
		return DEFAULT_SETTINGS.MASTER_VOLUME
	return master_volume
func get_music_volume() -> float:
	if loaded_data == {}: 
		return DEFAULT_SETTINGS.MUSIC_VOLUME
	return music_volume
func get_sfx_volume() -> float:
	if loaded_data == {}: 
		return DEFAULT_SETTINGS.SFX_VOLUME
	return sfx_volume
func get_ambience_volume() -> float:
	if loaded_data == {}: 
		return DEFAULT_SETTINGS.AMBIENCE_VOLUME
	return ambience_volume
func get_speech_volume() -> float:
	if loaded_data == {}: 
		return DEFAULT_SETTINGS.SPEECH_VOLUME
	return speech_volume
func get_mute_toggle_state() -> bool:
	return mute_state
func get_keybind(action : String):
	if(!loaded_data.has("keybinds")):
		match action:
			KEYBINDING_PLAYER.MOVE_FORWARD:
				return KEYBINDING_PLAYER.MOVE_FORWARD_DEFAULT_KEY
			KEYBINDING_PLAYER.MOVE_BACK:
				return KEYBINDING_PLAYER.MOVE_BACK_DEFAULT_KEY
			KEYBINDING_PLAYER.MOVE_LEFT:
				return KEYBINDING_PLAYER.MOVE_LEFT_DEFAULT_KEY
			KEYBINDING_PLAYER.MOVE_RIGHT:
				return KEYBINDING_PLAYER.MOVE_RIGHT_DEFAULT_KEY
			KEYBINDING_PLAYER.JUMP:
				return KEYBINDING_PLAYER.JUMP_DEFAULT_KEY
			KEYBINDING_PLAYER.SPRINT:
				return KEYBINDING_PLAYER.SPRINT_DEFAULT_KEY
			KEYBINDING_PLAYER.INVENTORY:
				return KEYBINDING_PLAYER.INVENTORY_DEFAULT_KEY
			KEYBINDING_PLAYER.PICK_UP:
				return KEYBINDING_PLAYER.PICK_UP_DEFAULT_KEY
			KEYBINDING_PLAYER.PAUSE:
				return KEYBINDING_PLAYER.PAUSE_DEFAULT_KEY
			KEYBINDING_PLAYER.CANCEL:
				return KEYBINDING_PLAYER.CANCEL_DEFAULT_KEY
	else:
		match action:
			KEYBINDING_PLAYER.MOVE_FORWARD:
				return KEYBINDING_PLAYER.move_forward_key
			KEYBINDING_PLAYER.MOVE_BACK:
				return KEYBINDING_PLAYER.move_back_key
			KEYBINDING_PLAYER.MOVE_LEFT:
				return KEYBINDING_PLAYER.move_left_key
			KEYBINDING_PLAYER.MOVE_RIGHT:
				return KEYBINDING_PLAYER.move_right_key
			KEYBINDING_PLAYER.JUMP:
				return KEYBINDING_PLAYER.jump_key
			KEYBINDING_PLAYER.SPRINT:
				return KEYBINDING_PLAYER.sprint_key
			KEYBINDING_PLAYER.INVENTORY:
				return KEYBINDING_PLAYER.inventory_key
			KEYBINDING_PLAYER.PICK_UP:
				return KEYBINDING_PLAYER.pick_up_key
			KEYBINDING_PLAYER.PAUSE:
				return KEYBINDING_PLAYER.pause_key
			KEYBINDING_PLAYER.CANCEL:
				return KEYBINDING_PLAYER.cancel_key
