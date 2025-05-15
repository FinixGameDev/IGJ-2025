extends Node3D

@onready var animation_player = $AnimationPlayer

func _ready() -> void:
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_dialogic_signal(argument: String) -> void:
	if argument.contains("anim_") && animation_player.get_animation(argument.lstrip("anim_") != null):
		animation_player.play(argument.lstrip("anim_"))
