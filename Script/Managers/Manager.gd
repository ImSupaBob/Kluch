class_name Manager
extends Node

static var ref: Manager

func _init():
	if not ref: 
		ref = self
	else: 
		queue_free()

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

