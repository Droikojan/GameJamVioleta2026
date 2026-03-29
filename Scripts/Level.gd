extends Control

@export var room1 : Control
@export var room2 : Control
@export var room3 : Control

@export var arrow_room1_bloqued : Control
@export var arrow_room2_bloqued : Control

@export var footsteps_sfx : AudioStreamPlayer

var current_room := 1
var room2_enter := false
var room3_enter := false

func _ready() -> void:
	room1.show()
	room2.hide()
	room3.hide()
	
	TextBox._load_dialog("dialogo_room1_inicio")
	
	GameController._reset_data()

func _process(_delta: float) -> void:
	if GameController.puzzle2_finished == false:
		arrow_room1_bloqued.hide()
	else:
		arrow_room1_bloqued.show()
	if GameController.puzzle1_finished == false or GameController.puzzle3_finished == false:
		arrow_room2_bloqued.hide()
	else:
		arrow_room2_bloqued.show()

func _change_room(next_room : int) -> void:
	current_room = next_room
	footsteps_sfx.play(0.0)
	if current_room == 1:
		room1.show()
		room2.hide()
		room3.hide()
	if current_room == 2:
		room1.hide()
		room2.show()
		room3.hide()
		if room2_enter == false:
			room2_enter = true
			TextBox._load_dialog("dialogo_room2_inicio")
	if current_room == 3:
		room1.hide()
		room2.hide()
		room3.show()
		if room3_enter == false:
			room3_enter = true
			TextBox._load_dialog("dialogo_room3_inicio")
