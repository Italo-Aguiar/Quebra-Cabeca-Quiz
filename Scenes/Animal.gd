extends Node2D

var board
var board_name

func _ready():
	randomize()
	var alts = ['Lagartixa', 'Planária', 'Minhoca', 'Protozoário']
	alts.shuffle()
	
	for i in range($Alternativas.get_children().size()):
		$Alternativas.get_child(i).get_child(0).set_text(alts[i])
	
	board = $TileMap.init_puzzle()
	match board:
		1: board_name = "Planária"

func _on_Pular_pressed():
	$Pular.hide()
	$Alternativas.show()
	$Descricao.show()
	$Etapa/Label.text = "2/2"
	$Monte/Label.text = "Que animal é esse?"
	pass


func _on_A_pressed():
	if $Alternativas/A/Label.text == board_name:
		for i in $Alternativas.get_children():
			i.disabled = true
		$Alternativas/A/Certo.show()
		yield(get_tree().create_timer(2), 'timeout')
		get_tree().change_scene('res://Scenes/Menu.tscn')
	else:
		for i in $Alternativas.get_children():
			i.disabled = true
		$Alternativas/A/Errado.show()
		for i in range($Alternativas.get_children().size()):
			if $Alternativas.get_child(i).get_child(0).text == board_name:
				$Alternativas.get_child(i).get_child(1).show()
		yield(get_tree().create_timer(2), 'timeout')
		get_tree().change_scene('res://Scenes/Menu.tscn')

func _on_B_pressed():
	if $Alternativas/B/Label.text == board_name:
		for i in $Alternativas.get_children():
			i.disabled = true
		$Alternativas/B/Certo.show()
		yield(get_tree().create_timer(2), 'timeout')
		get_tree().change_scene('res://Scenes/Menu.tscn')
	else:
		for i in $Alternativas.get_children():
			i.disabled = true
		$Alternativas/B/Errado.show()
		for i in range($Alternativas.get_children().size()):
			if $Alternativas.get_child(i).get_child(0).text == board_name:
				$Alternativas.get_child(i).get_child(1).show()
		yield(get_tree().create_timer(2), 'timeout')
		get_tree().change_scene('res://Scenes/Menu.tscn')

func _on_C_pressed():
	if $Alternativas/C/Label.text == board_name:
		for i in $Alternativas.get_children():
			i.disabled = true
		$Alternativas/C/Certo.show()
		yield(get_tree().create_timer(2), 'timeout')
		get_tree().change_scene('res://Scenes/Menu.tscn')
	else:
		for i in $Alternativas.get_children():
			i.disabled = true
		$Alternativas/C/Errado.show()
		for i in range($Alternativas.get_children().size()):
			if $Alternativas.get_child(i).get_child(0).text == board_name:
				$Alternativas.get_child(i).get_child(1).show()
		yield(get_tree().create_timer(2), 'timeout')
		get_tree().change_scene('res://Scenes/Menu.tscn')

func _on_D_pressed():
	if $Alternativas/D/Label.text == board_name:
		for i in $Alternativas.get_children():
			i.disabled = true
		$Alternativas/D/Certo.show()
		yield(get_tree().create_timer(2), 'timeout')
		get_tree().change_scene('res://Scenes/Menu.tscn')
	else:
		for i in $Alternativas.get_children():
			i.disabled = true
		$Alternativas/D/Errado.show()
		for i in range($Alternativas.get_children().size()):
			if $Alternativas.get_child(i).get_child(0).text == board_name:
				$Alternativas.get_child(i).get_child(1).show()
		yield(get_tree().create_timer(2), 'timeout')
		get_tree().change_scene('res://Scenes/Menu.tscn')
