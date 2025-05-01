extends MarginContainer


func _ready() -> void:
	$HBoxContainer/RSide/VersionLabel.text = AppGlobal.game_version

# Called when the node enters the scene tree for the first time.
func _input(event: InputEvent) -> void:
		AppGlobal.game_controller.change_gui_scene("res://scenes/menu_scenes/main_menu.tscn", true)
