class_name DownComponent
extends LogComponent

func run_command(curent_line : String):
	return Global.sum_lines(curent_line, "0_1")
