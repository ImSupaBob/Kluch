class_name Counter
extends Label

@export var recource_name : String
@export var _manager : Manager

func _ready():
	_manager.ref.resource_updated.connect(_update_counter)
	text = recource_name + ": " + str(_manager.ref.get_resource())

func _update_counter():
	text = recource_name + ": " + str(_manager.ref.get_resource())
