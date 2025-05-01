extends HBoxContainer

@onready var option_button = $Button as OptionButton

const RESOLUTION_DICTIONARY : Dictionary = {
	"(4:3) 640 x 480" : Vector2i(640, 480),
	"(4:3) 800 x 600" : Vector2i(800, 600),
	"(4:3) 1024 x 768" : Vector2i(1024, 768),
	"(4:3) 1280 x 1024" : Vector2i(1280, 1024),
	"(4:3) 2048 x 1536" : Vector2i(2048, 1536),
	"(16:9) 640 x 360" : Vector2i(640, 360),
	"(16:9) 1152 x 648" : Vector2i(1152, 648),
	"(16:9) 1280 x 720" : Vector2i(1280, 720),
	"(16:9) 1366 x 766" : Vector2i(1366, 768),
	"(16:9) 1600 x 900" : Vector2i(1600, 900),
	"(16:9) 1920 x 1080" : Vector2i(1920, 1080),
	"(16:9) 2048 x 1152" : Vector2i(2048, 1152),
	"(16:9) 2560 x 1440" : Vector2i(2560, 1440),
	"(16:9) 3840 x 2160" : Vector2i(3840, 2160),
	"(16:10) 1280 x 800" : Vector2i(1280, 800),
	"(16:10) 1440 x 900" : Vector2i(1440, 900),
	"(16:10) 1680 x 1050" : Vector2i(1680, 1050),
	"(16:10) 1920 x 1200" : Vector2i(1920, 1200),
	"(16:10) 2560 x 1600" : Vector2i(2560, 1600),
}

func _ready():
	option_button.item_selected.connect(on_resolution_selected)
	add_items()
	load_data()

func load_data() -> void:
	var index = RESOLUTION_DICTIONARY.values().find(SettingsDataContainer.get_resolution_vector())
	if index == -1:
		option_button.add_item("Custom")
		option_button.select(option_button.item_count - 1)
		option_button.item_selected.connect(func(index): 
			option_button.remove_item(option_button.item_count - 1), 
			 CONNECT_ONE_SHOT)
	else:
		option_button.select(index)

func add_items():
	for resolution_size_text in RESOLUTION_DICTIONARY:
		option_button.add_item(resolution_size_text)

func on_resolution_selected(index : int) -> void:
	SettingsSignalBus.emit_on_resolution_selected(RESOLUTION_DICTIONARY.values()[index])
