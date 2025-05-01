class_name InputChecker
extends Node

static var is_mouse = true

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event):
	if event is InputEventMouseMotion or event is InputEventMouseButton:
		is_mouse = true
	elif event is InputEventJoypadButton or (event is InputEventJoypadMotion && deadzone_check()):
		is_mouse = false
	
	if is_mouse:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	elif Input.mouse_mode != Input.MOUSE_MODE_CAPTURED:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

static func get_input_type() -> bool:
	return is_mouse

func deadzone_check():
	var deadzone = 0.45
	var joystick_vector = Vector2(Input.get_joy_axis(0,0), -Input.get_joy_axis(0,1)).length()
	return deadzone < joystick_vector
