#to do: creat arithmetic_operation_on_variable to replace IncreasVariable and DecreasVariable
class_name IncreasVariable 
extends TerminalLine

@export var number : int
@export var manager : Manager

func execute_line():
	manager.ref.arithmetic_operation(number)
