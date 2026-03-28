extends CanvasLayer

@onready var textbox: Label = $TextContainer/InnerContainer/HBoxContainer/Text

# Variables para el texto
var start = "START LABEL"
var end = "END LABEL"
var tween: Tween

# Variables para el JSON
var text_list: Array = []
var current_index: int = 0

# Nodos de sonidos
@onready var boom_sound: AudioStreamPlayer = $Sounds/BoomSound


func _ready() -> void:
	hide_textbox() # Esconder el cuadro por defecto

func _load_dialog(dialogCode: String) -> void:
	# Cargar el JSON de textos
	if dialogCode == "dialogo1":
		load_texts("res://Diagolos/dialogos.json")
	if dialogCode == "dialogo2":
		load_texts("res://Diagolos/dialogos.json")
	if dialogCode == "dialogo3":
		load_texts("res://Diagolos/dialogos.json")
	if dialogCode == "dialogo_fallo":
		load_texts("res://Diagolos/dialogo_fallo.json")

	current_index = 0
	show_next_textbox()

# Cargar los textos
func load_texts(route: String):
	if FileAccess.file_exists(route):
		var file = FileAccess.open(route, FileAccess.READ)
		var content = file.get_as_text()
		file.close()
		
		# Convertimos el texto del JSON en un Array de Godot
		var data = JSON.parse_string(content)
		if data is Array:
			text_list = data
		else:
			print("Error: El formato del JSON no es un Array")

# Mostrar el siguiente texto y maneja el recuento de indices
func show_next_textbox():
	if current_index < text_list.size():
		var loaded_data = text_list[current_index]
		show_textbox(loaded_data["texto"], loaded_data["status"], loaded_data["sound"])
		current_index += 1
	else:
		hide_textbox()
		print("Fin de la conversación")

func _input_event() -> void:
	# Si se sigue imprimiendo el texto, parar
	if tween and tween.is_running():
		tween.kill()
		textbox.visible_ratio = 1.0
	# Si ya paró, pasar al siguiente
	else:
		show_next_textbox()

# Esconder la caja de texto
func hide_textbox():
	textbox.text = ""
	hide()

# Mostrar la caja de texto y asignar acciones
func show_textbox(next_text, status = "normal", sound = "no"):
	textbox.text = next_text
	
	if tween:
		tween.kill()
	
	if (status == 'accion'):
		start = "* "
		end = " *"
	
	if (status == 'pensar'):
		start = "( "
		end = " )"
		
	if (status == 'normal'):
		start = ""
		end = ""
	
	if (sound == 'sonido1'):
		boom_sound.play()
	
	# Escibir el texto actual
	textbox.text = start + textbox.text + end
	textbox.visible_ratio = 0.0
	show()
	
	# Lanzar el tween
	tween = create_tween()
	var duracion = textbox.text.length() * 0.03
	tween.tween_property(textbox, "visible_ratio", 1.0, duracion).set_trans(Tween.TRANS_LINEAR)

func _on_button_pressed() -> void:
	_input_event()

func _on_button_2_pressed() -> void:
	_input_event()
