class_name Restart
extends Button

func _on_pressed():
	for manager in %Managers.get_children():
		manager.ref = null
	get_tree().reload_current_scene()
