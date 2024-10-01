class_name IfStatment 
extends TerminalLine

@export var comparison_number : int
@export var manager : Manager
@export_enum(
	">", "<","==", "!=", ">=", "<="
	) var comparison_operation: String

func execute_line():
	match comparison_operation:
		">":
			return manager.ref.get_resource() > comparison_number
		"<":
			return manager.ref.get_resource() < comparison_number
		"==":
			return manager.ref.get_resource() == comparison_number
		"!=":
			return manager.ref.get_resource() != comparison_number
		">=":
			return manager.ref.get_resource() >= comparison_number
		"<=":
			return manager.ref.get_resource() <= comparison_number
