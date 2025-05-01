extends HBoxContainer

@onready var audio_name = $Name as Label
@onready var audio_percentage = $Percentage as Label
@onready var audio_hslider = $HSlider as HSlider

@export_enum("Master", "Music", "SFX", "Dialogue") var bus_name : String

var bus_index : int = 0

func _ready():
	audio_hslider.value_changed.connect(on_value_changed)
	get_bus_name_by_index()
	load_data()
	set_name_label_text()
	set_slider_value()

func load_data() -> void:
	match bus_name:
		"Master":
			on_value_changed(SettingsDataContainer.get_master_sound_value())
		"Music":
			on_value_changed(SettingsDataContainer.get_music_sound_value())
		"SFX":
			on_value_changed(SettingsDataContainer.get_sfx_sound_value())
		"Dialogue":
			on_value_changed(SettingsDataContainer.get_dialogue_sound_value())


func set_slider_value() -> void:
	audio_hslider.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
	set_percentage_label()

func set_name_label_text() -> void:
	audio_name.text = str(bus_name) + " Volume"

func  set_percentage_label() -> void:
	audio_percentage.text = str(audio_hslider.value * 100) + "%"

func get_bus_name_by_index() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)

func on_value_changed(value: float) -> void:
	set_percentage_label()
	match bus_index:
		0:
			SettingsSignalBus.emit_on_master_sound_changed(value)
		1:
			SettingsSignalBus.emit_on_music_sound_changed(value)
		2:
			SettingsSignalBus.emit_on_sfx_sound_changed(value)
		3:
			SettingsSignalBus.emit_on_dialogue_sound_changed(value)
