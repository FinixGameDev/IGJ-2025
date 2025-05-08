extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HBoxContainer/PanelContainer/MarginContainer/TabContainer/Sound.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_exit_pressed() -> void:
	SettingsSignalBus.emit_set_settings_dictionary(SettingsDataContainer.create_storage_dictionary())
	AppGlobal.game_controller.change_gui_scene("res://scenes/menu_scenes/main_menu.tscn", true)
