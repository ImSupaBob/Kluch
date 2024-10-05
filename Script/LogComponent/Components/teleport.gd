class_name Teleport
extends LogComponent

@export var teleport_exit : Teleport
enum State {ENTRY, EXIT}
var state : State = State.ENTRY

func run_command(curent_line : String):
	if is_out_cell:
		return "1_1"
	match state:
		State.ENTRY:
			teleport_exit.state = State.EXIT
			return teleport_exit.line
		State.EXIT:
			state = State.ENTRY
			return Global.sum_lines(curent_line, "0_1")
