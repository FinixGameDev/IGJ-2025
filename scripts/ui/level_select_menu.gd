extends MarginContainer
func _ready():
	$VBoxContainer/TextureButton.grab_focus()

func _on_texture_button_pressed():
	AppGlobal.game_controller.change_gui_scene("res://scenes/menu_scenes/main_menu.tscn", true)
