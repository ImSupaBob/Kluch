class_name TerminalLine
extends Panel

@export var text_line : String
@export_enum(
	"init_variable", "increas_variable","decreas_variable",
	"if_statment", "break", "win", "logic_cell", "pass"
	) var command: String

@onready var key = $Key

func _ready():
	if has_node("Command"): #temporary solution
		$Command/Label.text = text_line

func show_key() -> void:
	key.visible = true

func hide_key() -> void:
	key.visible = false

func execute_line():
	pass
