extends HBoxContainer
@onready var option_button = $Button as OptionButton


const WINDOW_MODE_ARRAY : Array[String] = [
	"Full-Screen",
	"Windowed",
	"Borderless Full-Screen",
	"Borderless Window"
]

func _ready():
	option_button.item_selected.connect(on_window_mode_selected)
	set_options()
	load_data()

func load_data():
	on_window_mode_selected(SettingsDataContainer.get_window_mode_index())
	option_button.select(SettingsDataContainer.get_window_mode_index())

func set_options():
	for i in WINDOW_MODE_ARRAY:
		option_button.add_item(i)

func on_window_mode_selected(index : int) -> void:
	SettingsSignalBus.emit_on_window_mode_selected(index)
