extends CanvasLayer

var level_uid : String

func _ready() -> void:
	$AnimationPlayer.play("RESET")

func load_level(level_uid : String) -> void:
	self.level_uid = level_uid
	$AnimationPlayer.play("Transition")

func _load_level():
	get_tree().change_scene_to_file(level_uid)
