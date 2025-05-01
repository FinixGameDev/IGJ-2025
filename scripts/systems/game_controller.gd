class_name GameController
extends Node


@export var world_2d : Node2D
@export var gui : CanvasLayer
@export var transition_controller : SceneTransitionController

var current_2d_scene
var current_2d_cutscene
var current_gui_scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AppGlobal.game_controller = self
	current_gui_scene = $"GUI/SplashScreenManager"

func _process(delta):
	AppGlobal.debug.add_toggle_function("Hide UI", func(): gui.visible = !gui.visible)

func change_gui_scene(
	new_scene: String, 
	delete: bool, 
	keep_running: bool = false,
	transition: bool = true,
	transition_in: String = "fade_in",
	transition_out: String = "fade_out",
	seconds: float = 1.0
	) -> void:
	
	if transition:
		transition_controller.transition(transition_out, seconds)
		await transition_controller.animation_player.animation_finished
	
	if current_gui_scene != null:
		if delete:
			current_gui_scene.queue_free() # Removes node entirely
		elif keep_running:
			current_gui_scene.visible = false # Keeps in memory and running
		else:
			gui.remove_child(current_gui_scene) # Keeps in memory but doesn't run
	var new = load(new_scene).instantiate()
	gui.add_child(new)
	gui.move_child(new, 0)
	current_gui_scene = new
	
	transition_controller.transition(transition_in, seconds)

func change_2d_scene(
	new_scene: String, 
	delete: bool = true, 
	keep_running: bool = false,
	transition: bool = true,
	transition_in: String = "fade_in",
	transition_out: String = "fade_out",
	seconds: float = 1.0
	) -> void:
	if(ResourceLoader.load_threaded_get_status(new_scene) & 1 == 0):
		ResourceLoader.load_threaded_request(new_scene)

	if transition:
		transition_controller.transition(transition_out, seconds)
		await transition_controller.animation_player.animation_finished
	
	if current_2d_scene != null:
		if delete:
			current_2d_scene.queue_free() # Removes node entirely
		elif keep_running:
			current_2d_scene.visible = false # Keeps in memory and running
		else:
			world_2d.remove_child(current_2d_scene) # Keeps in memory but doesn't run

	var new 
	if(ResourceLoader.load_threaded_get_status(new_scene) == 3):
		new = ResourceLoader.load_threaded_get(new_scene).instantiate()
	else:
		new = load(new_scene).instantiate()
	world_2d.add_child(new)
	current_2d_scene = new
	
	transition_controller.transition(transition_in, seconds)
