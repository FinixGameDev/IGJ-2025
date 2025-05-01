extends Control

@export var text : String = ""
@export var screenshot : Texture2D = null
@export var level : PackedScene

@onready var button = $Button
@onready var texture = $Panel/MarginContainer/TextureRect

func _ready():
	if text !=  "":
		button.text = text
	
	if screenshot != null:
		texture = screenshot
	
	if level != null && AppGlobal.game_controller:
		button.connect("pressed",
		func():
			AppGlobal.game_controller.change_preloaded_2d_scene(level)
			AppGlobal.game_controller.change_gui_scene("res://scenes/menu_scenes/hud.tscn", true))
