class_name Game
extends Node2D

var termenal_lines : Dictionary = {}
var logic_cells : Array = []
var curent_line : String
@export var start_line : String = "1_1"

func _ready():
	curent_line = start_line
	logic_cells = get_tree().get_nodes_in_group("logic_cells")
	
	var lines : Array = get_tree().get_nodes_in_group("Lines")
	
	for line in lines:
		termenal_lines[line.name] = line
	
	#if ermenal_lines.get("Line1_1") != null:
	termenal_lines.get("Line" + start_line).show_key()

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
				break_terminal()
		"logic_cell":
			var logic_cell : LogicCell = line.get_node("LogicCell")
			var log_component : LogComponent = logic_cell.get_log_component()
			curent_line = log_component.run_command(curent_line)
		"break":
			print(start_line, curent_line)
			break_terminal()
		"win":
			_win()
			return
	
	line.hide_key()
	line = termenal_lines.get("Line" + curent_line)
	if line == null:
		break_terminal()
		return
	line.show_key()

func _change_scene():
	pass

func _win():
	await get_tree().create_timer(2).timeout
	_change_scene()

func jump_next_line():
	curent_line = Global.sum_lines(curent_line, "0_1")

func break_terminal():
	print(start_line, curent_line)
	curent_line = start_line
	print(start_line, curent_line)
