extends CheckButton

@onready var audio_slider = $"../MarginContainer/VBoxContainer/AudioSlider"
@onready var mute_label = $"../MuteLabel"
@onready var check_button = $"."

func _ready():
	check_button.toggled.connect(on_mute_toggled)
	
func load_data() -> void:
	on_mute_toggled(SettingsContainer.get_mute_toggle_state())

func on_mute_toggled(value : bool) -> void:
	set_label_text(value)
	audio_slider.mute_volume()
	SettingsSignalBus.emit_on_mute_toggled(value)

func set_label_text(value : bool) -> void:
	
	if value != true: mute_label.text = "Mute Off"	
	else: mute_label.text = "Mute All"
	
