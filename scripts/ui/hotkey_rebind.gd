extends HBoxContainer
class_name HotkeyRebind

@onready var label = $Name as Label
@onready var primary_button = $Button as Button
@onready var secondary_button = $Button2 as Button

@export var action_name : String = ""


func _ready():
	secondary_button.text = "None"
	primary_button.text = "None"
	set_process_unhandled_key_input(false)
	set_process_unhandled_input(false)
	set_action_name()
	set_text_for_key()
	load_keybinds()
	
	if OS.has_feature("android") or OS.has_feature("ios"):
		primary_button.visible = false

func load_keybinds() -> void:
	rebind_action_key(SettingsDataContainer.get_keybind(action_name))
	rebind_action_padbutton(SettingsDataContainer.get_joypad_button(action_name))

func set_action_name():
	label.text = "Unassigned"
	
	var converted_text = action_name.lstrip("game_")
	
	for i in range(converted_text.length()):
		if converted_text[i] == '_':
			converted_text[i] = ' '
	
	label.text = converted_text.to_upper()

func set_text_for_key():
	var action_events = InputMap.action_get_events(action_name)
	
	for i in action_events:
		if i is InputEventKey:
			primary_button.text = OS.get_keycode_string(i.physical_keycode)
		elif i is InputEventJoypadButton:
			var icon = AppGlobal.get_prompt_icon(i)
			if icon == null:
				secondary_button.text = i.as_text()
			else:
				secondary_button.set_button_icon(icon)
				secondary_button.text = ""

func _on_button_toggled(toggled_on):
	if toggled_on:
		primary_button.text = "Press key..."
		set_process_unhandled_key_input(toggled_on)
		
		for i in get_tree().get_nodes_in_group("hotkey_buttons"):
			if i.action_name != self.action_name:
				i.primary_button.toggle_mode = false
				i.set_process_unhandled_key_input(false)
		
	else:
		for i in get_tree().get_nodes_in_group("hotkey_buttons"):
			if i.action_name != self.action_name:
				i.primary_button.toggle_mode = true
				i.set_process_unhandled_key_input(false)
		
		set_text_for_key()

func _unhandled_key_input(event):
	rebind_action_key(event)
	primary_button.button_pressed = false

func _unhandled_input(event):
	if event is InputEventJoypadButton:
		rebind_action_padbutton(event)
		secondary_button.button_pressed = false

func rebind_action_key(event):
	SettingsDataContainer.set_keybind(action_name, event)
	set_process_unhandled_key_input(false)
	set_text_for_key()

func rebind_action_padbutton(event):
	SettingsDataContainer.set_joypad(action_name, event)
	set_process_unhandled_input(false)
	set_text_for_key()


func _on_button_2_toggled(toggled_on):
	if toggled_on:
		secondary_button.text = "Press Controller..."
		secondary_button.icon = null
		set_process_unhandled_input(toggled_on)
		
		for i in get_tree().get_nodes_in_group("hotkey_buttons"):
			if i.action_name != self.action_name:
				i.secondary_button.toggle_mode = false
				i.set_process_unhandled_input(false)
		
	else:
		for i in get_tree().get_nodes_in_group("hotkey_buttons"):
			if i.action_name != self.action_name:
				i.secondary_button.toggle_mode = true
				i.set_process_unhandled_input(false)
