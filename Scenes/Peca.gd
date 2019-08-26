extends Node2D

onready var origin = position

var selected

func _ready():
	add_to_group("Peca")
	enable_interaction()

func set_piece(t: Texture):
	$Sprite.set_texture(t)

func _process(delta):
	if selected:
		#Subtração da borda da viewport e metade do tamanho da textura
		var new_position = get_global_mouse_position() - Vector2(118, 233) - Vector2(170, 128)
		set_position(new_position)

func _on_Area2D_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton):
		if event.is_action_pressed("click"):
			set_z_index(1)
			selected = true
		elif event.is_action_released("click") and selected:
			set_z_index(0)
			selected = false
			
			var swap = get_parent().get_col(position + Vector2(170, 128))
			if swap:
				get_parent().swap_pieces(self, swap)
			set_position(origin)

func reset_pos():
	set_position(origin)

func enable_interaction():
	$Area2D.input_pickable = true

func disable_interaction():
	$Area2D.input_pickable = false