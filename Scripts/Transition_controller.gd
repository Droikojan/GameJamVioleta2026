extends CanvasLayer

var level_uid : String

var instance
var spawn_node
var puzzle_node

func _ready() -> void:
	$AnimationPlayer.play("RESET")

func load_level(level_uid : String) -> void:
	self.level_uid = level_uid
	$AnimationPlayer.play("Transition")

func load_puzzle(instance, self_node) -> void:
	self.instance = instance
	spawn_node = self_node
	$AnimationPlayer.play("LoadPuzzle")

func _load_puzzle():
	spawn_node.add_child(instance)

func close_puzzle(puzzle_node) -> void:
	self.puzzle_node = puzzle_node
	$AnimationPlayer.play("ClosePuzzle")

func _close_puzzle():
	puzzle_node.queue_free()

func _load_level():
	get_tree().change_scene_to_file(level_uid)
