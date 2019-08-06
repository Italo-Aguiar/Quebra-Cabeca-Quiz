extends Node2D

func _ready():
	#print(info.json["animais"][0]["nome"])
	pass

func _on_Animal_pressed():
	get_tree().change_scene("res://Scenes/Animal.tscn")


func _on_Reino_pressed():
	get_tree().change_scene("res://Scenes/Reino.tscn")