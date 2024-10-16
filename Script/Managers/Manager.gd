class_name Manager
extends Node

static var ref: Manager

func _init():
	if not ref:
		print(ref," 1")
		ref = self
		print(ref," 2")
	else:
		print(ref," 3")
		queue_free()
		print(ref," 4")

var _resource: int = 0

signal resource_updated
signal resource_added(value: int)
signal resource_spent(value: int)
signal arithmetic_operation_calculated(value: int)

func get_resource() -> int:
	return _resource

func arithmetic_operation(value: int) -> void:
	_resource += value
	
	arithmetic_operation_calculated.emit(value)
	resource_updated.emit()

