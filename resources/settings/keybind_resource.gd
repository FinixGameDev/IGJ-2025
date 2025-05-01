class_name KeybindResource
extends Resource

const MOVE_UP : String = "move_up"
const MOVE_DOWN : String = "move_down"
const MOVE_LEFT : String = "move_left"
const MOVE_RIGHT : String = "move_right"
const JUMP : String = "jump"
const INTERACT : String = "interact"
const PAUSE : String = "pause"

const DEFAULT_MOVE_UP_KEY = KEY_W
const DEFAULT_MOVE_DOWN_KEY = KEY_S
const DEFAULT_MOVE_LEFT_KEY  = KEY_A
const DEFAULT_MOVE_RIGHT_KEY  = KEY_D
const DEFAULT_JUMP_KEY  = KEY_SPACE
const DEFAULT_INTERACT_KEY  = KEY_E
const DEFAULT_PAUSE_KEY  = KEY_ESCAPE

const DEFAULT_MOVE_UP_BUTTON = JOY_BUTTON_DPAD_UP
const DEFAULT_MOVE_DOWN_BUTTON = JOY_BUTTON_DPAD_DOWN
const DEFAULT_MOVE_LEFT_BUTTON  = JOY_BUTTON_DPAD_LEFT
const DEFAULT_MOVE_RIGHT_BUTTON  = JOY_BUTTON_DPAD_RIGHT
const DEFAULT_JUMP_BUTTON  = JOY_BUTTON_A
const DEFAULT_INTERACT_BUTTON  = JOY_BUTTON_Y
const DEFAULT_PAUSE_BUTTON  = JOY_BUTTON_START


var move_up_key : InputEventKey = InputEventKey.new()
var move_down_key : InputEventKey = InputEventKey.new()
var move_left_key : InputEventKey = InputEventKey.new()
var move_right_key : InputEventKey = InputEventKey.new()
var jump_key : InputEventKey = InputEventKey.new()
var interact_key : InputEventKey = InputEventKey.new()
var pause_key : InputEventKey = InputEventKey.new()

var move_up_button : InputEventJoypadButton = InputEventJoypadButton.new()
var move_down_button : InputEventJoypadButton = InputEventJoypadButton.new()
var move_left_button : InputEventJoypadButton = InputEventJoypadButton.new()
var move_right_button : InputEventJoypadButton = InputEventJoypadButton.new()
var jump_button : InputEventJoypadButton = InputEventJoypadButton.new()
var interact_button : InputEventJoypadButton = InputEventJoypadButton.new()
var pause_button : InputEventJoypadButton = InputEventJoypadButton.new()
