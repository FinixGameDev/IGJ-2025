extends Control

func _ready() -> void:
	$MarginContainer/VBoxContainer/CenterContainer/MarginContainer/VBoxContainer/Button.grab_focus()


func _on_resume_pressed() -> void:
	AppGlobal.set_pause_subtree(AppGlobal.game_controller.world_2d, false)
	AppGlobal.game_controller.change_gui_scene("res://scenes/menu_scenes/hud.tscn", false, true, false)


func _on_quit_pressed() -> void:
	AppGlobal.game_controller.change_gui_scene("res://scenes/menu_scenes/main_menu.tscn", true)
	AppGlobal.game_controller.change_2d_scene("res://scenes/background_scenes/sewer_bg.tscn", true)
