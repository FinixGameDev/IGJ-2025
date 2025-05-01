extends Node

const SETTINGS_SAVE_PATH : String = "user://config.ini"

var settings_data_dict : Dictionary = {}

func _ready():
	SettingsSignalBus.set_settings_dictionary.connect(on_save_settings)
	load_settings()

func on_save_settings(data : Dictionary):
	var save_settings_data_file = FileAccess.open(SETTINGS_SAVE_PATH, FileAccess.WRITE)
	
	var json_data_string = JSON.stringify(data)
	
	save_settings_data_file.store_line(json_data_string)

func load_settings() -> void:
	if not FileAccess.file_exists(SETTINGS_SAVE_PATH):
		return
	
	var save_setting_data_file = FileAccess.open(SETTINGS_SAVE_PATH, FileAccess.READ)
	var loaded_data : Dictionary = {}
	
	while save_setting_data_file.get_position() < save_setting_data_file.get_length():
		var json_string = save_setting_data_file.get_line()
		var json = JSON.new()
		var _parse_result = json.parse(json_string)
		
		loaded_data = json.get_data()
	
	SettingsSignalBus.emit_load_settings_data(loaded_data)
