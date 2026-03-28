extends CanvasLayer

var puzzle_failed := false
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _process(_delta: float) -> void:
	if GameController.puzzle_failed == true and puzzle_failed == false:
		puzzle_failed = true
		_appear_border()
	else:
		pass

func _appear_border():
	animation_player.play("appear")
	TextBox._load_dialog("dialogo_fallo")
	await animation_player.animation_finished
	animation_player.play("idle")

func _quit_border():
	animation_player.play("RESET")

func _close_screen():
	animation_player.play("close")
	TextBox._load_dialog("dialogo_game_over")
	await TextBox.finish_textbox
	TransitionController.load_level("uid://5ok4y36qvqnn")
