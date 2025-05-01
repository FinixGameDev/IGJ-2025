extends MarginContainer


func _ready() -> void:
	if OS.has_feature("android") or OS.has_feature("ios"):
		$VBoxContainer/MobileControls.visible = true
	else:
		$VBoxContainer/MobileControls.visible = false

func _on_pause_button_pressed() -> void:
	AppGlobal.set_pause_subtree(AppGlobal.game_controller.world_2d, true)
	AppGlobal.game_controller.change_gui_scene("res://scenes/menu_scenes/pause_menu.tscn", false, true, false)
