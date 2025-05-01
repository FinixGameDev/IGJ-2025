extends Control

@export var version_text : Label
@export var continue_button : Button

func _ready():
	if AppGlobal.saves.is_empty():
		continue_button.disabled = true;
	
	$MarginContainer/HBoxContainer/LSide/GameOptions/NewGameButton.grab_focus()
	
	version_text.text = AppGlobal.game_version
	
	if OS.has_feature("android") or OS.has_feature("ios"):
		$MarginContainer/HBoxContainer/LSide/GameOptions/QuitButton.visible = false


func _on_play_button_pressed():
	AppGlobal.game_controller.change_gui_scene("res://scenes/menu_scenes/level_select_menu.tscn", true)

func _on_load_game_button_play():
	AppGlobal.game_controller.change_gui_scene("res://scenes/menu_scenes/save_manager_menu.tscn", false, false, false)

func _on_settings_pressed():
	AppGlobal.game_controller.change_gui_scene("res://scenes/menu_scenes/settings_menu.tscn", false, false)

func _on_quit_button_pressed():
	get_tree().quit()
