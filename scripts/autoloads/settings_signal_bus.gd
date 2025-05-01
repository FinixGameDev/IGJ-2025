extends Node

signal on_window_mode_selected(index : int)

signal on_resolution_selected(vector : Vector2i)

signal on_master_sound_changed(value: float)

signal on_music_sound_changed(value: float)

signal on_sfx_sound_changed(value: float)

signal on_dialogue_sound_changed(value: float)

signal set_settings_dictionary(settings_dict : Dictionary)

signal load_settings_data(settings_dict : Dictionary)

func emit_load_settings_data(settings_dict : Dictionary):
	load_settings_data.emit(settings_dict)

func emit_set_settings_dictionary(settings_dict : Dictionary):
	set_settings_dictionary.emit(settings_dict)

func emit_on_window_mode_selected(index : int) -> void:
	on_window_mode_selected.emit(index)

func emit_on_resolution_selected(vector : Vector2i) -> void:
	on_resolution_selected.emit(vector)

func emit_on_master_sound_changed(value : float) -> void:
	on_master_sound_changed.emit(value)

func emit_on_music_sound_changed(value : float) -> void:
	on_music_sound_changed.emit(value)

func emit_on_sfx_sound_changed(value : float) -> void:
	on_sfx_sound_changed.emit(value)

func emit_on_dialogue_sound_changed(value : float) -> void:
	on_dialogue_sound_changed.emit(value)
