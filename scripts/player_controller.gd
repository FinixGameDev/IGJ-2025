extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
const MOUSE_SENSITIVITY : float = 0.5
const TILT_UPPER_LIMIT := deg_to_rad(90.0)
const TILT_LOWER_LIMIT := deg_to_rad(-90.0)

@export var CAMERA_CONTROLLER : Node3D

var _mouse_input = false
var _mouse_rotation  : Vector3
var _player_rotation : Vector3
var _camera_rotation : Vector3
var _rotation_input : float
var _tilt_input : float

var inverted_controls = false

func  _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	AppGlobal.in_game = true

func _process(delta: float) -> void:
	update_camera(delta)

func _unhandled_input(event: InputEvent) -> void:
	_mouse_input = event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED
	
	if _mouse_input and not inverted_controls:
		_rotation_input = -event.relative.x * MOUSE_SENSITIVITY
		_tilt_input = -event.relative.y * MOUSE_SENSITIVITY
	elif _mouse_input:
		_rotation_input = event.relative.x * MOUSE_SENSITIVITY
		_tilt_input = event.relative.y * MOUSE_SENSITIVITY
	else:
		var camera_dir := Input.get_vector("game_look_left", "game_look_right", "game_look_up", "game_look_down", 0.15)
		_rotation_input = -camera_dir.x 
		_tilt_input = -camera_dir.y

func update_camera(delta: float) -> void:
	_mouse_rotation.x += _tilt_input * delta
	_mouse_rotation.x =  clamp(_mouse_rotation.x, TILT_LOWER_LIMIT, TILT_UPPER_LIMIT)
	_mouse_rotation.y += _rotation_input * delta
	
	_player_rotation = Vector3(0, _mouse_rotation.y, 0)
	_camera_rotation = Vector3(_mouse_rotation.x, 0, 0)
	
	CAMERA_CONTROLLER.transform.basis = Basis.from_euler(_camera_rotation)
	CAMERA_CONTROLLER.rotation.z = 0.0
	
	global_transform.basis = Basis.from_euler(_player_rotation)
	
	_rotation_input = 0
	_tilt_input = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("game_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("game_move_left", "game_move_right", "game_move_forward", "game_move_backward")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
