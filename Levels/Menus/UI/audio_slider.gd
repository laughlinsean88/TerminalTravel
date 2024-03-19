class_name AudioSlider
extends Control

@onready var audio_type = $HBoxContainer/AudioType as Label
@onready var audio_value = $HBoxContainer/AudioValue as Label
@onready var h_slider = $HBoxContainer/HSlider as HSlider

@export_enum("Master", "Music", "SFX", "Ambience", "Speech") var bus_name : String

var bus_index: int = 0

func _ready():
	h_slider.value_changed.connect(on_value_changed)
	get_bus_name_by_index()
	load_settings()
	set_name_label_text()
	set_slider_value()

func load_settings() -> void:
	match bus_name:
		"Master":
			on_value_changed(SettingsContainer.get_master_volume())
		"Music":
			on_value_changed(SettingsContainer.get_music_volume())
		"SFX":
			on_value_changed(SettingsContainer.get_sfx_volume())
		"Ambience":
			on_value_changed(SettingsContainer.get_ambience_volume())
		"Speech":
			on_value_changed(SettingsContainer.get_speech_volume())
	
	
func set_name_label_text() -> void:
	audio_type.text = str(bus_name + " Volume")
	
func set_audio_num_label_text() -> void:
	audio_value.text = str(h_slider.value * 100) + " %"

func get_bus_name_by_index() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)

func set_slider_value() -> void:
	h_slider.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
	set_audio_num_label_text()
	
func on_value_changed(value : float) -> void:
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))
	set_audio_num_label_text()
	
	match bus_index:
		0: 
			SettingsSignalBus.on_master_volume_set.emit(value)
		1: 
			SettingsSignalBus.on_music_volume_set.emit(value)
		2: 
			SettingsSignalBus.on_sfx_volume_set.emit(value)
		3: 
			SettingsSignalBus.on_ambience_volume_set.emit(value)
		4: 
			SettingsSignalBus.on_speech_volume_set.emit(value)
			

func mute_volume() -> void:
	AudioServer.set_bus_mute(0, not AudioServer.is_bus_mute(0))
