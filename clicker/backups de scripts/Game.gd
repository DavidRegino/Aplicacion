extends Control

const wasamamaya = preload("res://scripts estupidos/wasamamaya.gd")

var foquito = preload("res://escenas perronas/foquito.tscn")
var score = wasamamaya._get_instance().get_score()
var add = 1
var addpersec = 0
var combo = 0


func _on_Timer_timeout():
	var game_data = wasamamaya._get_instance()
	game_data.score += game_data.CPS_count #After the Timer resets, add the add per second to the score.
	actualizar_texto_label(game_data.score)

var CPSRequirement = 20 #Clicks required to upgrade Clicks Per Second
var CPCRequirement = 20 #Clicks required to upgrade Clicks Per Click
var CPSRequirement2 = 150 #Clicks required to upgrade Clicks Per Second #2
var CPCRequirement2 = 150 #Clicks required to upgrade Clicks Per Click #2
var CPSRequirement3 = 1400 #Clicks required to upgrade Clicks Per Second #3
var CPCRequirement3 = 1400 #Clicks required to upgrade Clicks Per Click #3
var CPSRequirement4 = 12000 #Clicks required to upgrade Clicks Per Second #4
var CPCRequirement4 = 12000 #Clicks required to upgrade Clicks Per Click #4
var CPSRequirement5 = 200000 #Clicks required to upgrade Clicks Per Second #5
var CPCRequirement5 = 200000 #Clicks required to upgrade Clicks Per Click #5

func _on_CPC1_pressed():
	var game_data = wasamamaya._get_instance() #carga el arhivo wasamamaya para poder usar sus valores
	var game_data_instance = $wasamamayaNode
	if game_data.score >= CPCRequirement:
		game_data.score -= CPCRequirement
		CPCRequirement = round(CPCRequirement * 1.4)
		add = add + 1 #Add CPC
		game_data.CPC_count += 1
		$VBoxContainer2/CPC1.text = str("+1 CPC [", CPCRequirement, "]") #Combine multiple strings to show the required clicks.
		$Label3.text = str("CPC:", add)
		actualizar_texto_label(game_data.score)

func _on_CPS1_pressed():
	var game_data = wasamamaya._get_instance()
	if game_data.score >= CPSRequirement:
		game_data.score -= CPSRequirement
		CPSRequirement = round(CPSRequirement * 1.4)
		game_data.CPS_count += 1
		$VBoxContainer/CPS1.text = str("+1 CPS [", CPSRequirement, "]") #Combine multiple strings to show the required clicks.
		$Label2.text = str("CPS:", addpersec)
		actualizar_texto_label(game_data.score)

func _on_CPS2_pressed():
	var game_data = wasamamaya._get_instance()
	if game_data.score >= CPSRequirement2:
		game_data.score -= CPSRequirement2
		CPSRequirement2 = round(CPSRequirement2 * 1.3)
		game_data.CPS_count += 5
		$VBoxContainer/CPS2.text = str("+5 CPS [", CPSRequirement2, "]") #Combine multiple strings to show the required clicks.
		$Label2.text = str("CPS:", addpersec)
		actualizar_texto_label(game_data.score)


func _on_CPC2_pressed():
	var game_data = wasamamaya._get_instance()
	if game_data.score >= CPCRequirement2:
		game_data.score -= CPCRequirement2
		CPCRequirement2 = round(CPCRequirement2 * 1.3)
		game_data.CPC_count += 5
		$VBoxContainer2/CPC2.text = str("+5 CPC [", CPCRequirement2, "]") #Combine multiple strings to show the required clicks.
		$Label3.text = str("CPC:", add)
		actualizar_texto_label(game_data.score)


func _on_CPS3_pressed():
	var game_data = wasamamaya._get_instance()
	if game_data.score >= CPSRequirement3:
		game_data.score -= CPSRequirement3
		CPSRequirement3 = round(CPSRequirement3 * 1.2)
		game_data.CPS_count += 20
		$VBoxContainer/CPS3.text = str("+20 CPS [", CPSRequirement3, "]") #Combine multiple strings to show the required clicks.
		$Label2.text = str("CPS:", addpersec)
		actualizar_texto_label(game_data.score)


func _on_CPC3_pressed():
	var game_data = wasamamaya._get_instance()
	if game_data.score >= CPCRequirement3:
		game_data.score -= CPCRequirement3
		CPCRequirement3 = round(CPCRequirement3 * 1.2)
		game_data.CPC_count += 20
		$VBoxContainer2/CPC3.text = str("+20 CPC [", CPCRequirement3, "]") #Combine multiple strings to show the required clicks.
		$Label3.text = str("CPC:", add)
		actualizar_texto_label(game_data.score)


func _on_CPS4_pressed():
	var game_data = wasamamaya._get_instance()
	if game_data.score >= CPSRequirement4:
		game_data.score -= CPSRequirement4
		CPSRequirement4 = round(CPSRequirement4 * 1.1)
		game_data.CPS_count += 125
		$VBoxContainer/CPS4.text = str("+125 CPS [", CPSRequirement4, "]") #Combine multiple strings to show the required clicks.
		$Label2.text = str("CPS:", addpersec)
		actualizar_texto_label(game_data.score)


func _on_CPC4_pressed():
	var game_data = wasamamaya._get_instance()
	if game_data.score >= CPCRequirement4:
		game_data.score -= CPCRequirement4
		CPCRequirement4 = round(CPCRequirement4 * 1.1)
		game_data.CPC_count += 125
		$VBoxContainer2/CPC4.text = str("+125 CPC [", CPCRequirement4, "]") #Combine multiple strings to show the required clicks.
		$Label3.text = str("CPC:", add)
		actualizar_texto_label(game_data.score)


func _on_CPS5_pressed():
	var game_data = wasamamaya._get_instance()
	if game_data.score >= CPSRequirement5:
		game_data.score -= CPSRequirement5
		CPSRequirement5 = CPSRequirement5
		game_data.CPS_count += 500
		$VBoxContainer/CPS5.text = str("+500 CPS [", CPSRequirement5, "]") #Combine multiple strings to show the required clicks.
		$Label2.text = str("CPS:", addpersec)
		actualizar_texto_label(game_data.score)


func _on_CPC5_pressed():
	var game_data = wasamamaya._get_instance()
	if game_data.score >= CPCRequirement5:
		game_data.score -= CPCRequirement5
		CPCRequirement5 = CPCRequirement5
		game_data.CPC_count += 500
		$VBoxContainer2/CPC5.text = str("+500 CPC [", CPCRequirement5, "]") #Combine multiple strings to show the required clicks.
		$Label3.text = str("CPC:", add)
		actualizar_texto_label(game_data.score)


func _on_boton_pressed():
	var spawn_de_foquito = foquito.instantiate()
	# Obtener las coordenadas del mouse en relación con el mundo
	var mouse_position = get_global_mouse_position()
	
	add_child(spawn_de_foquito) #aparece el foco
	
	# Establecer la posición del cuerpo rígido de la galleta en las coordenadas del mouse
	spawn_de_foquito.global_position = mouse_position
	  # Aplicar fuerza inicial a la galleta (opcional)
	spawn_de_foquito.get_node("RigidBody2D").apply_impulse(Vector2(0, -200), Vector2.ZERO)
	# Iniciar temporizador para desaparición de la galleta
	spawn_de_foquito.get_node("Timer").start()
	
	var game_data = wasamamaya._get_instance()
	#var game_data = game_data_instance._get_instance()
	game_data.score += game_data.CPC_count
	actualizar_texto_label(game_data.score)
	
func actualizar_texto_label(nuevo_valor_score):
	$Score.text = "IQ: " + str(nuevo_valor_score)
	#score += add
	

	
func _on_tanganana_pressed():
	get_tree().change_scene_to_file("res://escenas perronas/tangananica.tscn")


func _on_tienda_perrona_pressed():
	get_tree().change_scene_to_file("res://escenas perronas/tienda.tscn")
