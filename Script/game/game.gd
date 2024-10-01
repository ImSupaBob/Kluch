class_name Game
extends Node2D

var termenal_lines : Dictionary = {}
var logic_cells : Array = []
var curent_line : String = "1_1"

func _ready():
	logic_cells = get_tree().get_nodes_in_group("logic_cells")
	
	var lines : Array = get_tree().get_nodes_in_group("Lines")
	
	for line in lines:
		termenal_lines[line.name] = line
		
	termenal_lines.get("Line1_1").show_key()

func _on_termenal_process_timeout():
	#check is logic cell not empty
	for logic_cell in logic_cells:
		if logic_cell.is_empty():
			return
	
	var line : TerminalLine = termenal_lines.get("Line" + curent_line)
	
	var command = line.command
	
	match command:
		"pass":
			jump_next_line()
		"init_variable": # to do: creat new manager
			#line.execute_line()
			jump_next_line()
		"increas_variable":
			line.execute_line()
			jump_next_line()
		"decreas_variable":
			line.execute_line()
			jump_next_line()
		"if_statment":
			var is_pass_if : bool = line.execute_line()
			if is_pass_if:
				jump_next_line()
			elif !is_pass_if:
				curent_line = "1_1"
		"logic_cell":
			var logic_cell : LogicCell = line.get_node("LogicCell")
			var component_command : String = logic_cell.get_component_command()
			curent_line = _sum_lines(curent_line, component_command)
			print(curent_line)
		"break":
			curent_line = "1_1"
		"win":
			_change_scene()
			return
	
	line.hide_key()
	line = termenal_lines.get("Line" + curent_line)
	if line == null:
		curent_line = "1_1"
		return
	line.show_key()

func _change_scene():
	pass

func jump_next_line():
	curent_line = _sum_lines(curent_line, "0_1")

func _sum_lines(first_line : String, second_line : String) -> String:
	var first_number = first_line.split("_")
	var second_number = second_line.split("_")
	return str(int(first_number[0]) + int(second_number[0])) +\
	 "_" + str(int(first_number[-1]) + int(second_number[-1]))
