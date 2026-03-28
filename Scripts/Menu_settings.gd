extends CanvasLayer

@export var music_volume_slider: HSlider
@export var sfx_volume_slider: HSlider

var music_bus : int
var sfx_bus : int

func _ready() -> void:
	hide()
	
	music_bus = AudioServer.get_bus_index("Music")
	sfx_bus = AudioServer.get_bus_index("SFX")
	
	music_volume_slider.value = ConfigSave.load_music_volume_config()
	sfx_volume_slider.value = ConfigSave.load_effects_volume_config()

func _on_back_button_pressed() -> void:
	hide()
	ConfigSave.save_config(music_volume_slider.value, sfx_volume_slider.value)

func _on_music_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(music_bus, linear_to_db(value))

func _on_sfx_volume_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sfx_bus, linear_to_db(value))
