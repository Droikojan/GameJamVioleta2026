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
@onready var armas_sound: AudioStreamPlayer = $Sounds/ArmasSound
@onready var click_puerta_sound: AudioStreamPlayer = $Sounds/ClickPuertaSound
@onready var dolor_cabeza_sound: AudioStreamPlayer = $Sounds/DolorCabezaSound
@onready var gritos_sound: AudioStreamPlayer = $Sounds/GritosSound
@onready var has_obtenido_sound: AudioStreamPlayer = $Sounds/HasObtenidoSound
@onready var sacar_imagen_sound: AudioStreamPlayer = $Sounds/SacarImagenSound
@onready var sonido_final_sound: AudioStreamPlayer = $Sounds/SonidoFinalSound

# Nodos de imagen
@onready var image_1: TextureRect = $Images/Image1
@onready var image_2: TextureRect = $Images/Image2
@onready var image_3: TextureRect = $Images/Image3
@onready var image_4: TextureRect = $Images/Image4
@onready var image_5: TextureRect = $Images/Image5
@onready var image_6: TextureRect = $Images/Image6

signal finish_textbox

func _ready() -> void:
	hide_textbox() # Esconder el cuadro por defecto
	
	fade_out_image(image_1)
	fade_out_image(image_2)
	fade_out_image(image_3)
	fade_out_image(image_4)
	fade_out_image(image_5)
	fade_out_image(image_6)

func _load_dialog(dialogCode: String) -> void:
	# Cargar el JSON de textos
	load_texts("res://Diagolos/"+dialogCode+".json")
	#if dialogCode == "dialogo1":
		#load_texts("res://Diagolos/dialogos.json")
	#if dialogCode == "dialogo2":
		#load_texts("res://Diagolos/dialogos.json")
	#if dialogCode == "dialogo3":
		#load_texts("res://Diagolos/dialogos.json")
	#if dialogCode == "dialogo_fallo":
		#load_texts("res://Diagolos/dialogo_fallo.json")
	#if dialogCode == "dialogo_game_over":
		#load_texts("res://Diagolos/dialogo_game_over.json")

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
		show_textbox(loaded_data["texto"], loaded_data["status"], loaded_data["sound"], loaded_data["imagen"])
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
	emit_signal("finish_textbox")

# Mostrar la caja de texto y asignar acciones
func show_textbox(next_text, status = "normal", sound = "no", imagen = "no"):
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
	
	if (sound == 'mostrar_sonido_estruendoso'):
		boom_sound.play()
	
	if (sound == 'mostrar_sonido_choque'):
		boom_sound.play()
	
	if (sound == 'mostrar_sonido_puerta'):
		click_puerta_sound.play()
	
	if (sound == 'sacar_imagen_trozo'):
		sacar_imagen_sound.play()
	
	if (sound == 'armas'):
		armas_sound.play()
	
	if (sound == 'mostrar_sonido_gritosarmas'):
		gritos_sound.play()
	
	if (sound == 'fin_sonido_gritosarmas'):
		gritos_sound.stop()
	
	if (sound == 'dolor_cabeza'):
		dolor_cabeza_sound.play()
	
	if (sound == 'parar_dolor_cabeza'):
		dolor_cabeza_sound.stop()
	
	if (sound == 'musica_final'):
		get_tree().get_first_node_in_group("BackgroundMusic").stop()
		sonido_final_sound.play()
	
	if (sound == 'parar_musica_final'):
		sonido_final_sound.stop()
	
	if (imagen == 'mostrar_imagen_trozo1'):
		fade_in_image(image_1)
	
	if (imagen == 'ocultar_imagen_trozo1'):
		fade_out_image(image_1)
	
	if (imagen == 'mostrar_imagen_trozo2'):
		fade_in_image(image_2)
	
	if (imagen == 'ocultar_imagen_trozo2'):
		fade_out_image(image_2)
	
	if (imagen == 'mostrar_imagen_trozo3'):
		fade_in_image(image_3)
	
	if (imagen == 'ocultar_imagen_trozo3'):
		fade_out_image(image_3)
	
	if (imagen == 'mostrar_imagen4'):
		fade_in_image(image_4)
	
	if (imagen == 'ocultar_imagen4'):
		fade_out_image(image_4)
	
	if (imagen == 'imagen_interferencias'):
		fade_in_image(image_5)
	
	if (imagen == 'ocultar_imagen_interferencia'):
		fade_out_image(image_5)
	
	if (imagen == 'mostrar_imagen_completa'):
		fade_in_image(image_4)
	
	if (imagen == 'mostrar_imagen_6'):
		fade_in_image(image_6)
	
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

func fade_out_image(node: TextureRect):
	print("Ocultando")
	var tween = create_tween()
	tween.tween_property(node, "modulate:a", 0.0, 1.0) # 1 segundo

func fade_in_image(node: TextureRect):
	print("Mostrando")
	var tween = create_tween()
	tween.tween_property(node, "modulate:a", 1.0, 1.0) # 1 segundo
