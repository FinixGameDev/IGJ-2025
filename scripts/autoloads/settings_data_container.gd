extends Node

@onready var default_settings : DefaultSettingsResource = preload("res://resources/settings/default_settings.tres")
@onready var keybind_resource : KeybindResource = preload("res://resources/settings/KeybindResource.tres")

var window_mode_index : int = 0
var resolution_vector : Vector2i = Vector2i(1920, 1080)
var master_volume : float = 1.0
var music_volume : float = 1.0
var sfx_volume : float = 1.0
var dialogue_volume : float = 1.0

var loaded_data : Dictionary = {}

func create_storage_dictionary() -> Dictionary:
	var settings_dict : Dictionary = {
		"window_mode_index" : window_mode_index,
		"resolution_vector_x" : resolution_vector.x,
		"resolution_vector_y" : resolution_vector.y,
		"master_volume" : master_volume,
		"music_volume" : music_volume,
		"sfx_volume" : sfx_volume,
		"dialogue_volume" : dialogue_volume,
		"keybinds" : create_keybinds_dictionary(),
		"buttons" : create_buttons_dictionary()
	}
	
	return settings_dict

func create_keybinds_dictionary() -> Dictionary:
	var keybinds_container_dict = {
		keybind_resource.MOVE_UP : keybind_resource.move_up_key,
		keybind_resource.MOVE_DOWN : keybind_resource.move_down_key,
		keybind_resource.MOVE_LEFT : keybind_resource.move_left_key,
		keybind_resource.MOVE_RIGHT : keybind_resource.move_right_key,
		keybind_resource.JUMP : keybind_resource.jump_key,
		keybind_resource.INTERACT : keybind_resource.interact_key,
		keybind_resource.PAUSE : keybind_resource.pause_key,
	}
	
	return keybinds_container_dict

func create_buttons_dictionary() -> Dictionary:
	var buttons_container_dict = {
		keybind_resource.MOVE_UP : keybind_resource.move_up_button,
		keybind_resource.MOVE_DOWN : keybind_resource.move_down_button,
		keybind_resource.MOVE_LEFT : keybind_resource.move_left_button,
		keybind_resource.MOVE_RIGHT : keybind_resource.move_right_button,
		keybind_resource.JUMP : keybind_resource.jump_button,
		keybind_resource.INTERACT : keybind_resource.interact_button,
		keybind_resource.PAUSE : keybind_resource.pause_button,
	}
	
	return buttons_container_dict

func get_window_mode_index():
	if loaded_data == {}:
		return default_settings.DEFAULT_WINDOW_MODE_INDEX
	return window_mode_index

func get_resolution_vector() -> Vector2i:
	if loaded_data == {}:
		return default_settings.DEFAULT_RESOLUTION
	return resolution_vector

func get_master_sound_value():
	if loaded_data == {}:
		return default_settings.DEFAULT_MASTER_VOLUME
	return master_volume

func get_music_sound_value():
	if loaded_data == {}:
		return default_settings.DEFAULT_MUSIC_VOLUME
	return music_volume

func get_sfx_sound_value():
	if loaded_data == {}:
		return default_settings.DEFAULT_SFX_VOLUME
	return sfx_volume

func get_dialogue_sound_value():
	if loaded_data == {}:
		return default_settings.DEFAULT_DIALOGUE_VOLUME
	return dialogue_volume

func get_keybind(action : String):
	
	if not loaded_data.has("keybinds"):
		match action:
			keybind_resource.MOVE_UP:
				var key = InputEventKey.new()
				key.set_physical_keycode(keybind_resource.DEFAULT_MOVE_UP_KEY)
				return key
			keybind_resource.MOVE_DOWN:
				var key = InputEventKey.new()
				key.set_physical_keycode(keybind_resource.DEFAULT_MOVE_DOWN_KEY)
				return key
			keybind_resource.MOVE_LEFT:
				var key = InputEventKey.new()
				key.set_physical_keycode(keybind_resource.DEFAULT_MOVE_LEFT_KEY)
				return key
			keybind_resource.MOVE_RIGHT:
				var key = InputEventKey.new()
				key.set_physical_keycode(keybind_resource.DEFAULT_MOVE_RIGHT_KEY)
				return key
			keybind_resource.JUMP:
				var key = InputEventKey.new()
				key.set_physical_keycode(keybind_resource.DEFAULT_JUMP_KEY)
				return key
			keybind_resource.INTERACT:
				var key = InputEventKey.new()
				key.set_physical_keycode(keybind_resource.DEFAULT_INTERACT_KEY)
				return key
			keybind_resource.PAUSE:
				var key = InputEventKey.new()
				key.set_physical_keycode(keybind_resource.DEFAULT_PAUSE_KEY)
				return key
	else :
		match action:
			keybind_resource.MOVE_UP:
				return keybind_resource.move_up_key
			keybind_resource.MOVE_DOWN:
				return keybind_resource.move_down_key
			keybind_resource.MOVE_LEFT:
				return keybind_resource.move_left_key
			keybind_resource.MOVE_RIGHT:
				return keybind_resource.move_right_key
			keybind_resource.JUMP:
				return keybind_resource.jump_key
			keybind_resource.INTERACT:
				return keybind_resource.interact_key
			keybind_resource.PAUSE:
				return keybind_resource.pause_key

func get_joypad_button(action : String):
	if not loaded_data.has("buttons"):
		match action:
			keybind_resource.MOVE_UP:
				var key = InputEventJoypadButton.new()
				key.button_index = keybind_resource.DEFAULT_MOVE_UP_BUTTON
				return key
			keybind_resource.MOVE_DOWN:
				var key = InputEventJoypadButton.new()
				key.button_index = keybind_resource.DEFAULT_MOVE_DOWN_BUTTON
				return key
			keybind_resource.MOVE_LEFT:
				var key = InputEventJoypadButton.new()
				key.button_index = keybind_resource.DEFAULT_MOVE_LEFT_BUTTON
				return key
			keybind_resource.MOVE_RIGHT:
				var key = InputEventJoypadButton.new()
				key.button_index = keybind_resource.DEFAULT_MOVE_RIGHT_BUTTON
				return key
			keybind_resource.JUMP:
				var key = InputEventJoypadButton.new()
				key.button_index = keybind_resource.DEFAULT_JUMP_BUTTON
				return key
			keybind_resource.INTERACT:
				var key = InputEventJoypadButton.new()
				key.button_index = keybind_resource.DEFAULT_INTERACT_BUTTON
				return key
			keybind_resource.PAUSE:
				var key = InputEventJoypadButton.new()
				key.button_index = keybind_resource.DEFAULT_PAUSE_BUTTON
				return key
	else :
		match action:
			keybind_resource.MOVE_UP:
				return keybind_resource.move_up_button
			keybind_resource.MOVE_DOWN:
				return keybind_resource.move_down_button
			keybind_resource.MOVE_LEFT:
				return keybind_resource.move_left_button
			keybind_resource.MOVE_RIGHT:
				return keybind_resource.move_right_button
			keybind_resource.JUMP:
				return keybind_resource.jump_button
			keybind_resource.INTERACT:
				return keybind_resource.interact_button
			keybind_resource.PAUSE:
				return keybind_resource.pause_button

func on_window_mode_selected(index : int) -> void:
	window_mode_index = index
	
	match index:
		0: # Full-Screen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		1: # Windowed
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		2: # Border-less FullScreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		3: # Border-less Windowed
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)

func on_resolution_selected(vector : Vector2i) -> void:
	resolution_vector = vector
	DisplayServer.window_set_size(vector)

func on_master_sound_changed(value : float) -> void:
	AudioServer.set_bus_volume_db(0, linear_to_db(value))
	master_volume = value

func on_music_sound_changed(value : float) -> void:
	AudioServer.set_bus_volume_db(1, linear_to_db(value))
	music_volume = value

func on_sfx_sound_changed(value : float) -> void:
	AudioServer.set_bus_volume_db(2, linear_to_db(value))
	sfx_volume = value

func on_dialogue_sound_changed(value : float) -> void:
	AudioServer.set_bus_volume_db(3, linear_to_db(value))
	dialogue_volume = value

func set_keybind(action: String, event : InputEventKey)-> void:
	match action:
		keybind_resource.MOVE_UP:
			keybind_resource.move_up_key = event
		keybind_resource.MOVE_DOWN:
			keybind_resource.move_down_key = event
		keybind_resource.MOVE_LEFT:
			keybind_resource.move_left_key = event
		keybind_resource.MOVE_RIGHT:
			keybind_resource.move_right_key = event
		keybind_resource.JUMP:
			keybind_resource.jump_key = event
		keybind_resource.INTERACT:
			keybind_resource.interact_key = event
		keybind_resource.PAUSE:
			keybind_resource.pause_key = event
	
	var previous_event = InputMap.action_get_events(action).filter(func(x): if x is InputEventKey: return x)
	if not previous_event.is_empty():
		InputMap.action_erase_event(action, previous_event[0])
	InputMap.action_add_event(action, event)

func set_joypad(action: String, event: InputEventJoypadButton) -> void:
	match action:
		keybind_resource.MOVE_UP:
			keybind_resource.move_up_button = event
		keybind_resource.MOVE_DOWN:
			keybind_resource.move_down_button = event
		keybind_resource.MOVE_LEFT:
			keybind_resource.move_left_button = event
		keybind_resource.MOVE_RIGHT:
			keybind_resource.move_right_button = event
		keybind_resource.JUMP:
			keybind_resource.jump_button = event
		keybind_resource.INTERACT:
			keybind_resource.interact_button = event
		keybind_resource.PAUSE:
			keybind_resource.pause_button = event
	
	var previous_event = InputMap.action_get_events(action).filter(func(x): if x is InputEventJoypadButton: return x)
	if not previous_event.is_empty():
		InputMap.action_erase_event(action, previous_event[0])
	InputMap.action_add_event(action, event)

func on_buttons_loaded(data: Dictionary) -> void:
	var loaded_move_up = InputEventJoypadButton.new()
	var loaded_move_down = InputEventJoypadButton.new()
	var loaded_move_right = InputEventJoypadButton.new()
	var loaded_move_left = InputEventJoypadButton.new()
	var loaded_jump = InputEventJoypadButton.new()
	var loaded_interact = InputEventJoypadButton.new()
	var loaded_pause = InputEventJoypadButton.new()
	
	loaded_move_up.button_index = int(data.move_up)
	loaded_move_down.button_index = int(data.move_down)
	loaded_move_left.button_index = int(data.move_left)
	loaded_move_right.button_index = int(data.move_right)
	loaded_jump.button_index = int(data.jump)
	loaded_interact.button_index = int(data.interact)
	loaded_pause.button_index = int(data.pause)
	
	keybind_resource.move_up_button = loaded_move_up
	keybind_resource.move_down_button = loaded_move_down
	keybind_resource.move_left_button = loaded_move_left
	keybind_resource.move_right_button = loaded_move_right
	keybind_resource.jump_button = loaded_jump
	keybind_resource.interact_button = loaded_interact
	keybind_resource.pause_button = loaded_pause

func on_keybinds_loaded(data : Dictionary) -> void:
	var loaded_move_up = InputEventKey.new()
	var loaded_move_down = InputEventKey.new()
	var loaded_move_right = InputEventKey.new()
	var loaded_move_left = InputEventKey.new()
	var loaded_jump = InputEventKey.new()
	var loaded_interact = InputEventKey.new()
	var loaded_pause = InputEventKey.new()
	
	loaded_move_up.physical_keycode = int(data.move_up)
	loaded_move_down.physical_keycode = int(data.move_down)
	loaded_move_left.physical_keycode = int(data.move_left)
	loaded_move_right.physical_keycode = int(data.move_right)
	loaded_jump.physical_keycode = int(data.jump)
	loaded_interact.physical_keycode = int(data.interact)
	loaded_pause.physical_keycode = int(data.pause)
	
	keybind_resource.move_up_key = loaded_move_up
	keybind_resource.move_down_key = loaded_move_down
	keybind_resource.move_left_key = loaded_move_left
	keybind_resource.move_right_key = loaded_move_right
	keybind_resource.jump_key = loaded_jump
	keybind_resource.interact_key = loaded_interact
	keybind_resource.pause_key = loaded_pause

func on_settings_data_loaded(data : Dictionary) -> void:
	loaded_data = data
	on_window_mode_selected(loaded_data.window_mode_index)
	on_resolution_selected(Vector2i(loaded_data.resolution_vector_x, loaded_data.resolution_vector_y))
	on_master_sound_changed(loaded_data.master_volume)
	on_music_sound_changed(loaded_data.music_volume)
	on_sfx_sound_changed(loaded_data.sfx_volume)
	on_dialogue_sound_changed(loaded_data.dialogue_volume)
	on_keybinds_loaded(loaded_data.keybinds)

func _ready():
	handle_signals()
	create_storage_dictionary()

func handle_signals() -> void:
	SettingsSignalBus.on_window_mode_selected.connect(on_window_mode_selected)
	SettingsSignalBus.on_resolution_selected.connect(on_resolution_selected)
	SettingsSignalBus.on_master_sound_changed.connect(on_master_sound_changed)
	SettingsSignalBus.on_music_sound_changed.connect(on_music_sound_changed)
	SettingsSignalBus.on_sfx_sound_changed.connect(on_sfx_sound_changed)
	SettingsSignalBus.on_dialogue_sound_changed.connect(on_dialogue_sound_changed)
	SettingsSignalBus.load_settings_data.connect(on_settings_data_loaded)
