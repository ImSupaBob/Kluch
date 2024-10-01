class_name LogicCell
extends StaticBody2D

var log_component : LogComponent

signal log_component_inserted

func  _ready():
	log_component_inserted.connect(_on_log_component_inserted)

func is_empty() -> bool:
	if log_component == null:
		return true
	else:
		return false

func set_log_component(_log_component : LogComponent) -> void:
	log_component = _log_component
	log_component_inserted.emit()

func get_log_component() -> LogComponent:
	return log_component

func delet_log_component() -> void:
	log_component = null

func _on_log_component_inserted() -> void:
	log_component.pick_up.connect(_on_log_component_pick_up)

func _on_log_component_pick_up() -> void:
	log_component.pick_up.disconnect(_on_log_component_pick_up)
	delet_log_component()

func get_component_command() -> String:
	return log_component.component_command
