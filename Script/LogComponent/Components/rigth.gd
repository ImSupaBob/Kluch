class_name RigthComponent
extends LogComponent

func run_command(curent_line : String):
	return Global.sum_lines(curent_line, "1_0")
