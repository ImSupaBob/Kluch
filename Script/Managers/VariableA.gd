class_name VariableA
extends Manager

static var ref: Manager

func _ready() -> void:
	if not ref:
		print(ref," 1")
		ref = self
		print(ref," 2")
	else:
		print(ref," 3")
		queue_free()
		print(ref," 4")
