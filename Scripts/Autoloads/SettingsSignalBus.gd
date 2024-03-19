extends Node

signal on_windows_mode_selected(index : int)
signal on_resolution_selected(index : int)
signal on_master_volume_set(volume : float)
signal on_music_volume_set(volume : float)
signal on_sfx_volume_set(volume : float)
signal on_ambience_volume_set(volume : float)
signal on_speech_volume_set(volume : float)
signal on_mute_toggled(value: bool)

signal set_settings_dictionary(settings_dict : Dictionary)
signal load_settings_data(settings_dict : Dictionary)

func emit_set_settings_dictionary(settings_dic :Dictionary) -> void:
	set_settings_dictionary.emit(settings_dic)

func emit_load_settings_data(settings_dic :Dictionary) -> void:
	load_settings_data.emit(settings_dic)
	
func emit_on_windows_mode_selected(index: int) -> void:
	on_windows_mode_selected.emit(index)

func emit_on_resolution_selected(index: int) -> void:
	on_resolution_selected.emit(index)

func emit_on_master_volume_set(volume: float) -> void:
	on_master_volume_set.emit(volume)

func emit_on_music_volume_set(volume: float) -> void:
	on_music_volume_set.emit(volume)

func emit_on_sfx_volume_set(volume: float) -> void:
	on_sfx_volume_set.emit(volume)

func emit_on_ambience_volume_set(volume: float) -> void:
	on_ambience_volume_set.emit(volume)

func emit_on_speech_volume_set(volume: float) -> void:
	on_speech_volume_set.emit(volume)

func emit_on_mute_toggled(value: bool) -> void:
	on_mute_toggled.emit(value)


