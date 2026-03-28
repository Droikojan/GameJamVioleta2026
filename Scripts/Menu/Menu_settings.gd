extends CanvasLayer

@export var music_volume_slider: HSlider
@export var sfx_volume_slider: HSlider

@export var settings_button: Control
@export var settings: Control

var music_bus : int
var sfx_bus : int

func _ready() -> void:
	settings.hide()
	settings.mouse_filter = Control.MOUSE_FILTER_IGNORE
	
	music_bus = AudioServer.get_bus_index("Music")
	sfx_bus = AudioServer.get_bus_index("SFX")
	
	music_volume_slider.value = ConfigSave.load_music_volume_config()
	sfx_volume_slider.value = ConfigSave.load_effects_volume_config()

func _process(_delta: float) -> void:
	if get_tree().get_nodes_in_group("StartMenu").size() > 0 or settings.visible:
		settings_button.hide()
	else:
		settings_button.show()

func show_settings():
	settings.show()

func _on_settings_button_pressed() -> void:
	settings.show()

func _on_back_button_pressed() -> void:
	settings.hide()
	ConfigSave.save_config(music_volume_slider.value, sfx_volume_slider.value)

func _on_music_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(music_bus, linear_to_db(value))

func _on_sfx_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sfx_bus, linear_to_db(value))
