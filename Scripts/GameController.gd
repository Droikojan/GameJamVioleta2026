extends Node

var puzzle1_finished := false
var puzzle2_finished := false
var puzzle3_finished := false
var puzzle4_finished := false

var puzzle_failed := false

func _reset_data():
	puzzle1_finished = false
	puzzle2_finished = false
	puzzle3_finished = false
	puzzle4_finished = false
	puzzle_failed = false

func _puzzle_finished(puzzle_id : int):
	if puzzle_id == 1:
		puzzle1_finished = true
	if puzzle_id == 2:
		puzzle2_finished = true
	if puzzle_id == 3:
		puzzle3_finished = true
	if puzzle_id == 4:
		puzzle4_finished = true

func _puzzle_failed():
	if puzzle_failed == true:
		DamagedMask._close_screen()
	puzzle_failed = true
