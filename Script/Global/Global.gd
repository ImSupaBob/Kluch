extends Node

func sum_lines(first_line : String, second_line : String) -> String:
	var first_number = first_line.split("_")
	var second_number = second_line.split("_")
	return str(int(first_number[0]) + int(second_number[0])) +\
	 "_" + str(int(first_number[-1]) + int(second_number[-1]))
