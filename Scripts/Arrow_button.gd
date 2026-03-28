extends TextureButton

@export var next_room : int = 1

@onready var cooldown: Timer = $Cooldown


func _on_pressed() -> void:
	get_tree().get_first_node_in_group("RoomController")._change_room(next_room)
