extends Control

@export var next_level : Button
@export var return_to_main : Button
@onready var level_label = $MarginContainer/HBoxContainer/VBoxContainer3/PanelContainer/LevelName

func _ready():
	level_label.text = AppGlobal.game_controller.current_level.level_name
	next_level.pressed.connect(play_next_level)
	return_to_main.pressed.connect(return_to_main_menu)

func return_to_main_menu() -> void:
	AppGlobal.game_controller.change_2d_scene("res://scenes/background_scenes/sewer_bg.tscn", true)
	AppGlobal.game_controller.change_gui_scene("res://scenes/menu_scenes/main_menu.tscn", true)

func play_next_level() -> void:
	AppGlobal.game_controller.change_preloaded_2d_scene(AppGlobal.game_controller.current_level.next_level)
	AppGlobal.game_controller.change_gui_scene("res://scenes/menu_scenes/hud.tscn", true)
