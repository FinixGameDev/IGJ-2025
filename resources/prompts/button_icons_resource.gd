class_name ButtonIconsResource
extends Resource

func create_buttons_dict() -> Dictionary:
	var buttons = {
	JOY_BUTTON_INVALID : joypad_button_invalid,
	JOY_BUTTON_A : joypad_button_a,
	JOY_BUTTON_B : joypad_button_b,
	JOY_BUTTON_Y : joypad_button_y,
	JOY_BUTTON_X : joypad_button_x,
	JOY_BUTTON_BACK : joypad_button_back,
	JOY_BUTTON_GUIDE : joypad_button_guide,
	JOY_BUTTON_START : joypad_button_start,
	JOY_BUTTON_LEFT_STICK : joypad_button_left_stick,
	JOY_BUTTON_RIGHT_STICK : joypad_button_right_stick,
	JOY_BUTTON_LEFT_SHOULDER : joypad_button_left_shoulder,
	JOY_BUTTON_RIGHT_SHOULDER : joypad_button_right_shoulder,
	JOY_BUTTON_DPAD_UP : joypad_button_dpad_up,
	JOY_BUTTON_DPAD_DOWN : joypad_button_dpad_down,
	JOY_BUTTON_DPAD_RIGHT : joypad_button_dpad_right,
	JOY_BUTTON_DPAD_LEFT : joypad_button_dpad_left,
	JOY_BUTTON_MISC1 : joypad_button_misc1,
	}
	
	return buttons

func create_axis_dict() -> Dictionary:
	var axis = {
	JOY_AXIS_INVALID : joypad_axis_invalid,
	JOY_AXIS_LEFT_X : joypad_left_x,
	JOY_AXIS_LEFT_Y : joypad_left_y,
	JOY_AXIS_RIGHT_X : joypad_right_x,
	JOY_AXIS_RIGHT_Y : joypad_right_y,
	JOY_AXIS_TRIGGER_LEFT : joypad_trigger_left,
	JOY_AXIS_TRIGGER_RIGHT : joypad_trigger_right
	}
	return axis



@export var joypad_button_invalid : Texture2D = Texture2D.new()
@export var joypad_button_a : Texture2D = Texture2D.new()
@export var joypad_button_b : Texture2D = Texture2D.new()
@export var joypad_button_y : Texture2D = Texture2D.new()
@export var joypad_button_x : Texture2D = Texture2D.new()
@export var joypad_button_back : Texture2D = Texture2D.new()
@export var joypad_button_guide : Texture2D = Texture2D.new()
@export var joypad_button_start : Texture2D = Texture2D.new()
@export var joypad_button_left_stick : Texture2D = Texture2D.new()
@export var joypad_button_right_stick : Texture2D = Texture2D.new()
@export var joypad_button_left_shoulder : Texture2D = Texture2D.new()
@export var joypad_button_right_shoulder : Texture2D = Texture2D.new()
@export var joypad_button_dpad_up : Texture2D = Texture2D.new()
@export var joypad_button_dpad_down : Texture2D = Texture2D.new()
@export var joypad_button_dpad_left : Texture2D = Texture2D.new()
@export var joypad_button_dpad_right : Texture2D = Texture2D.new()
@export var joypad_button_misc1 : Texture2D = Texture2D.new()

@export var joypad_axis_invalid : Texture2D = Texture2D.new()
@export var joypad_left_x : Texture2D = Texture2D.new()
@export var joypad_left_y : Texture2D = Texture2D.new()
@export var joypad_right_x : Texture2D = Texture2D.new()
@export var joypad_right_y : Texture2D = Texture2D.new()
@export var joypad_trigger_left : Texture2D = Texture2D.new()
@export var joypad_trigger_right : Texture2D = Texture2D.new()
