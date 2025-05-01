#Credit to StayAtHomeDev for the script:
#https://www.youtube.com/watch?v=Zhvtlh_TIY8
class_name DebugMenu extends Control

var properties : Array
var functions : Array


@onready var container = $PanelContainer/VBoxContainer

const fps_to_ms = 16

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AppGlobal.debug = self
	visible = false

func _physics_process(_delta: float) -> void:
	add_debug_property("FPS", Engine.get_frames_per_second(), 1)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("game_debug"):
		if not AppGlobal.game_controller.gui.visible:
			AppGlobal.game_controller.gui.visible = true
		else:
			visible = not visible
		get_viewport().set_input_as_handled()

func add_debug_property(id: StringName, value, time_in_frames)-> void:
	if properties.has(id):
		if Time.get_ticks_msec() / fps_to_ms % time_in_frames == 0:
			var target = container.find_child(id, true, false) as Label
			target.text = id + ": " + str(value)
	else:
		var property = Label.new()
		container.add_child(property)
		property.name = id
		property.text = id + ": " + str(value)
		properties.append(id)

func add_toggle_function(id : StringName, function: Callable,  value: Variant = null ):
	if functions.has(id):
		var target = container.find_child(id, true, false) as Button
		target.text = id
		if value != null : target.text = target.text + str(value)
		target.connect("pressed", function)
		target.focus_mode = Control.FOCUS_NONE
	else :
		var toggle = Button.new()
		container.add_child(toggle)
		toggle.name = id
		toggle.text = id
		if value != null : toggle.text = toggle.text + str(value)
		toggle.connect("pressed", function)
		functions.append(id)
