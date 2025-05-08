extends TabBar

@export var hotkey_rebind = preload("res://scenes/menu_scenes/hotkey_rebind.tscn")
@onready var container = $MarginContainer/ScrollContainer/VBoxContainer

func _ready() -> void:
	var hotkeys : Array[StringName] = get_game_inputs()
	for hotkey in hotkeys:
		var button = hotkey_rebind.instantiate() as HotkeyRebind
		button.action_name = hotkey
		container.add_child(button)
	

func get_game_inputs() -> Array[StringName]:
	var all_actions = InputMap.get_actions()
	return all_actions.filter(
			func(action : String): return action.begins_with("game_")
		)
