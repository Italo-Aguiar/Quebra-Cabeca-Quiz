extends Node2D



func _on_Pular_pressed():
	$Pular.hide()
	$Alternativas.show()
	$Descricao.show()
	$Etapa/Label.text = "2/2"
	$Monte/Label.text = "Que animal é esse?"
	pass
