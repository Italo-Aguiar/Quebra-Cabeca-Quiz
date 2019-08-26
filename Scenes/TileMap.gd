extends TileMap

export (PackedScene) var PECA

const PATH = "res://Images/"

var numero_puzzles = 1 


func _ready():
	randomize()

func init_puzzle():
	var random_board = randi() % numero_puzzles + 1 #como numero_puzzles = 1, sempre vai ser um, mas caso aumente
	var random_indexes = generate_random_indexes()
	
	for i in range(3):
		for j in range(3):
			var p = PECA.instance()
			var p_grid_pos = Vector2(j,i)
			var p_pos = map_to_world(p_grid_pos)
			var p_name = str(random_indexes.pop_front())
			var p_texture = load(PATH + str(random_board) + "/" + p_name + ".png")
			
			set_cellv(p_grid_pos, int(p_name))
			p.set_name(p_name)
			p.set_piece(p_texture)
			p.set_position(p_pos)
			add_child(p)
	return random_board
func generate_random_indexes():
	#retorna um array de 1 a 9, randomizado
	var rand_index = [1, 2, 3, 4, 5, 6, 7, 8, 9]
	rand_index.shuffle()
	return rand_index

func get_col(pos: Vector2):
	var grid_pos = world_to_map(pos)
	return get_node(str(get_cellv(grid_pos)))

func swap_pieces(p1, p2):
	var p1_new_pos = p2.origin
	var p2_new_pos = p1.origin
	
	set_cellv(world_to_map(p1_new_pos), int(p1.name))
	set_cellv(world_to_map(p2_new_pos), int(p2.name))
	
	p1.origin = p1_new_pos
	p1.reset_pos()
	p2.origin = p2_new_pos
	p2.reset_pos()
	
	var answer = check_answer()
	if answer:
		get_tree().call_group("Peca", "disable_interaction")
		#Mostra a imagem completa, alternativas, esconde pular etc
		get_parent().get_node('Pular').hide()
		get_parent().get_node('Alternativas').show()
		get_parent().get_node('Descricao').show()
		get_parent().get_node('Etapa/Label').text = "2/2"
		get_parent().get_node('Monte/Label').text = "Que animal é esse?"
		
func check_answer():
	var count = 1
	for i in range(3):
		for j in range(3):
			var pos = Vector2(j, i)
			if get_cellv(pos) != count:
				return false
			count += 1
	return true