extends Node

var json
var a = "a"

func _ready():
	var f = File.new()
	if !f.file_exists("res://Json/data.json"):
		print("Arquivo não existe")
		return
	
	if f.open("res://Json/data.json", File.READ) != 0:
		print("Erro ao abrir arquivo")
		return
		
	json = parse_json(f.get_as_text())