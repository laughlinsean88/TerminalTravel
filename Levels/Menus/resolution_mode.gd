extends Control

@onready var option_button = $HBoxContainer/OptionButton as OptionButton

const RESOLUTION_MODE : Dictionary = {
	"1152 x 648" : Vector2i(1152, 648),
	"1280 x 720" : Vector2i(1280, 720),
	"1920 x 1080": Vector2i(1920, 1080)
}

func _ready():
	option_button.item_selected.connect(on_resolution_mode_selected)
	add_resolution_mode_items()	
	load_data()
		
func load_data() -> void:
	on_resolution_mode_selected(SettingsContainer.get_resolution_mode_index())
	option_button.select(SettingsContainer.get_resolution_mode_index())

func add_resolution_mode_items() -> void:
	for resolution_mode in RESOLUTION_MODE:
		option_button.add_item(resolution_mode)	
func on_resolution_mode_selected(index : int) -> void:
	SettingsSignalBus.emit_on_resolution_selected(index)
	DisplayServer.window_set_size(RESOLUTION_MODE.values()[index])
