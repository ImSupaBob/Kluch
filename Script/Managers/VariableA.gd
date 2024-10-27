class_name VariableA
extends Manager

static var ref: Manager

func _ready() -> void:
	if not ref:
		ref = self
	else:
		queue_free()
