class_name LogComponent
extends StaticBody2D

var selected : bool = false
var creat_point : Vector2 
var rest_point : Vector2

@onready var detecter_area = $Area2D

signal pick_up
signal drop_down

func _ready():
	creat_point = global_position
	rest_point = creat_point
	
	drop_down.connect(_on_drop_down)

func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("click"):
		selected = true
		pick_up.emit()

func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
	else:
		global_position = lerp(global_position, rest_point, 25 * delta)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			selected = false
			drop_down.emit()

func _on_drop_down():
	if detecter_area.has_overlapping_bodies():
		var logic_cell : LogicCell = detecter_area.get_overlapping_bodies()[0]
		if logic_cell.is_empty():
			rest_point = logic_cell.global_position
			logic_cell.set_log_component(self)
	else:
		rest_point = global_position

func run_command(curent_line : String):
	pass
