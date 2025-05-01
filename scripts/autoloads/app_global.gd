extends Node

var game_controller : GameController
var debug : DebugMenu
var saves : Array

var game_version : String
@onready var game_prompts : ButtonIconsResource = preload("res://resources/prompts/xbox_prompts.tres")
@onready var buttons = game_prompts.create_buttons_dict()
@onready var axis = game_prompts.create_axis_dict()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	game_version = ProjectSettings.get_setting("application/config/version")
	
	if OS.has_feature("windows"):
		game_version += "_win"
	elif OS.has_feature("linux"):
		game_version += "_linux"
	elif OS.has_feature("android"):
		game_version += "_android"
	elif  OS.has_feature("ios"):
		game_version += "_ios"
	elif  OS.has_feature("macos"):
		game_version += "_macos"
	elif  OS.has_feature("web"):
		game_version += "_web"
	
	if OS.has_feature("demo"):
		game_version += "_demo"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func get_prompt_icon(event : InputEvent) -> Texture2D:
	if event is InputEventKey:
		return null
	elif event is InputEventJoypadButton:
		return buttons[event.button_index]
	elif event is InputEventJoypadMotion:
		return axis[event.axis]
	else:
		return null

func set_pause_subtree(root: Node, pause: bool) -> void:
	var process_setters = ["set_process",
	"set_physics_process",
	"set_process_input",
	"set_process_unhandled_input",
	"set_process_unhandled_key_input",
	"set_process_shortcut_input",]
	
	for setter in process_setters:
		root.propagate_call(setter, [!pause])
