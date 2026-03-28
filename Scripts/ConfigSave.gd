extends Node


func _ready() -> void:
	pass

func save_best_score(score:int):
	var config = ConfigFile.new()
	config.set_value("game","best_score", score)
	config.save("user://best_score.cfg")
	print("Guardando " + str(score))

func save_config(music_volume:float, effects_volume:float):
	var config = ConfigFile.new()
	config.set_value("config","music_volume", music_volume)
	config.set_value("config","effects_volume", effects_volume)
	config.save("user://config.cfg")

func load_best_score() -> int:
	var config = ConfigFile.new()
	var err = config.load("user://best_score.cfg")
	if err != OK:
		return 0
	return config.get_value("game", "best_score")

func load_music_volume_config() -> float:
	var config = ConfigFile.new()
	var err = config.load("user://config.cfg")
	if err != OK:
		return 1.0
	return config.get_value("config", "music_volume")

func load_effects_volume_config() -> float:
	var config = ConfigFile.new()
	var err = config.load("user://config.cfg")
	if err != OK:
		return 1.0
	return config.get_value("config", "effects_volume")
