extends Node

signal fade_in_ended
signal fade_out_ended

func fade_in(node, time: float):
	var subtract: float = 1/time/10
	node.modulate.a = 1
	while node.modulate.a > 0:
		node.modulate.a -= subtract
		yield(get_tree().create_timer(0.1),"timeout")
	emit_signal("fade_in_ended")

func fade_out(node, time: float):
	var sum: float = 1/time/10
	node.modulate.a = 0
	while node.modulate.a < 1:
		node.modulate.a += sum
		yield(get_tree().create_timer(0.1),"timeout")
	emit_signal("fade_out_ended")