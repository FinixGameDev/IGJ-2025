extends Control

@onready var prompt_icon = $Prompt/TextureRect
@onready var prompt_label = $Prompt/Label

func _ready() -> void:
	_check_prompt()

func _physics_process(delta: float) -> void:
	_check_prompt()

func _check_prompt():
	var interact = InputMap.action_get_events("game_interact")
	var action : InputEventJoypadButton 
	
	for i in interact:
		if i is InputEventJoypadButton:
			action = i
	
	if InputChecker.is_mouse:
		prompt_icon.texture = null
		prompt_label.text = "[E] Interact"
	else:
		prompt_icon.texture = AppGlobal.get_prompt_icon(action)
		prompt_label.text = "Interact"
