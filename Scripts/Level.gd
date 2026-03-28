extends Control

@export var room1 : Control
@export var room2 : Control
@export var room3 : Control

var current_room := 1

func _ready() -> void:
	room1.show()
	room2.hide()
	room3.hide()

func _change_room(next_room : int) -> void:
	current_room = next_room
	if current_room == 1:
		room1.show()
		room2.hide()
		room3.hide()
	if current_room == 2:
		room1.hide()
		room2.show()
		room3.hide()
	if current_room == 3:
		room1.hide()
		room2.hide()
		room3.show()
