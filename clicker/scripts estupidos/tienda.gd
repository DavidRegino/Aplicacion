extends Control

const wasamamaya = preload("res://scripts estupidos/wasamamaya.gd")
var game_data = wasamamaya._get_instance()

func visible():
	if game_data.score > 100:
		$TiendaClicks/CPC2.visible = true
		$TiendaSegundos/CPS2.visible = true
	if game_data.score > 1000:
		$TiendaClicks/CPC3.visible = true
		$TiendaSegundos/CPS3.visible = true

func _on_timer_timeout():
	visible()
	game_data.score += game_data.CPS_count #After the Timer resets, add the add per second to the score.

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

func _on_cpc_1_pressed(): #carga el arhivo wasamamaya para poder usar sus valores
	if game_data.score >= CPCRequirement:
		game_data.score -= CPCRequirement
		CPCRequirement = round(CPCRequirement * 1.4)
		game_data.CPC_count += 1
		$TiendaClicks/CPC1.text = str("+1 CPC [", CPCRequirement, "]") #Combine multiple strings to show the required clicks.
		$Valores/CPC.text = str("CPC:", game_data.CPC_count)

func _on_cps_1_pressed():
	if game_data.score >= CPSRequirement:
		game_data.score -= CPSRequirement
		CPSRequirement = round(CPSRequirement * 1.4)
		game_data.CPS_count += 1
		$TiendaSegundos/CPS1.text = str("+1 CPS [", CPSRequirement, "]") #Combine multiple strings to show the required clicks.
		$Valores/CPS.text = str("CPS:", game_data.CPS_count)

func _on_cps_2_pressed():
	if game_data.score >= CPSRequirement2:
		game_data.score -= CPSRequirement2
		CPSRequirement2 = round(CPSRequirement2 * 1.3)
		game_data.CPS_count += 5
		$TiendaSegundos/CPS2.text = str("+5 CPS [", CPSRequirement2, "]") #Combine multiple strings to show the required clicks.
		$Valores/CPS.text = str("CPS:", game_data.CPS_count)


func _on_cpc_2_pressed():
	if game_data.score >= CPCRequirement2:
		game_data.score -= CPCRequirement2
		CPCRequirement2 = round(CPCRequirement2 * 1.3)
		game_data.CPC_count += 5
		$TiendaClicks/CPC2.text = str("+5 CPC [", CPCRequirement2, "]") #Combine multiple strings to show the required clicks.
		$Valores/CPC.text = str("CPC:", game_data.CPC_count)


func _on_cps_3_pressed():
	if game_data.score >= CPSRequirement3:
		game_data.score -= CPSRequirement3
		CPSRequirement3 = round(CPSRequirement3 * 1.2)
		game_data.CPS_count += 20
		$TiendaSegundos/CPS3.text = str("+20 CPS [", CPSRequirement3, "]") #Combine multiple strings to show the required clicks.
		$Valores/CPS.text = str("CPS:", game_data.CPS_count)


func _on_cpc_3_pressed():
	if game_data.score >= CPCRequirement3:
		game_data.score -= CPCRequirement3
		CPCRequirement3 = round(CPCRequirement3 * 1.2)
		game_data.CPC_count += 20
		$TiendaClicks/CPC3.text = str("+20 CPC [", CPCRequirement3, "]") #Combine multiple strings to show the required clicks.
		$Valores/CPC.text = str("CPC:", game_data.CPC_count)


func _on_cps_4_pressed():
	if game_data.score >= CPSRequirement4:
		game_data.score -= CPSRequirement4
		CPSRequirement4 = round(CPSRequirement4 * 1.1)
		game_data.CPS_count += 125
		$TiendaSegundos/CPS4.text = str("+125 CPS [", CPSRequirement4, "]") #Combine multiple strings to show the required clicks.
		$Valores/CPC.text = str("CPS:", game_data.CPS_count)


func _on_cpc_4_pressed():
	if game_data.score >= CPCRequirement4:
		game_data.score -= CPCRequirement4
		CPCRequirement4 = round(CPCRequirement4 * 1.1)
		game_data.CPC_count += 125
		$TiendaClicks/CPC4.text = str("+125 CPC [", CPCRequirement4, "]") #Combine multiple strings to show the required clicks.
		$Valores/CPC.text = str("CPC:", game_data.CPC_count)


func _on_cps_5_pressed():
	if game_data.score >= CPSRequirement5:
		game_data.score -= CPSRequirement5
		CPSRequirement5 = CPSRequirement5
		game_data.CPS_count += 500
		$TiendaSegundos/CPS5.text = str("+500 CPS [", CPSRequirement5, "]") #Combine multiple strings to show the required clicks.
		$Valores/CPC.text = str("CPS:", game_data.CPS_count)


func _on_cpc_5_pressed():
	if game_data.score >= CPCRequirement5:
		game_data.score -= CPCRequirement5
		CPCRequirement5 = CPCRequirement5
		game_data.CPC_count += 500
		$TiendaClicks/CPC5.text = str("+500 CPC [", CPCRequirement5, "]") #Combine multiple strings to show the required clicks.
		$Valores/CPC.text = str("CPC:", game_data.CPC_count)
